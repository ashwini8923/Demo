# -*- coding: utf-8 -*-
# pragma pylint: disable=unused-argument, no-self-use
# (c) Copyright IBM Corp. 2010, 2022. All Rights Reserved.

import json
from logging import getLogger
from resilient_lib.components.resilient_common import validate_fields, str_to_bool
from resilient_lib.components.requests_common import RequestsCommon
from pathlib import Path
import zipfile
from datetime import datetime
import urllib3
urllib3.disable_warnings()


LOG = getLogger(__name__)
DEFAULT_API_VERSION = "6.10"
PACKAGE_NAME = "fn_forcepoint"

class ForcepointSmcClient:
    """Object to handle the communication and authentication between the integration and firewall"""
    def __init__(self, opts:dict, fp_config: dict):
        # validate config fields
        validate_fields(["forcepoint_host", "api_key"], fp_config)

        self.rc = RequestsCommon(opts, fp_config)

        self.__key = fp_config["api_key"] 
        self.__url_path = fp_config.get('api_version', DEFAULT_API_VERSION)
        self.verify = str_to_bool(fp_config.get("cert", "False"))

        self.host = fp_config["forcepoint_host"]
        self.query_parameters = {}
        
        self.headers = {
            "Content-type": "application/json"
        }

    def __build_url(self, resource_uri):
        "build url for api calls"
        return u"/".join([self.host, self.__url_path, resource_uri])
    
    def login(self) -> None:
        """Login to the Forcepoint SMC API.
        
        1. Login
        2. Set cookie in the header
        """
        
        payload = json.dumps({
            "authenticationkey": self.__key 
        })
        
        login_response = self.rc.execute("POST", self.__build_url("login"), headers= self.headers, verify = self.verify, data=payload)

        if login_response.status_code == 200 and isinstance(login_response.content, bytes):
            LOG.info("Logged In to the Forcepoint SMC.")
            LOG.info(f'-----------------> {login_response.headers["Set-Cookie"]}, {login_response}')
            # Check the cookie
            if "Set-Cookie" in login_response.headers:
                # 2. Set cookie in the header
                self.headers["Cookie"] = login_response.headers["Set-Cookie"]
            else:
                msg = "Cookie is not found in the response."
                LOG.error(msg)
                raise Exception(msg)
        else:
            LOG.info(login_response.json())
    
    def logout(self) -> None:
        """Logout from the Forcepoint SMC API.
        
        1. Send request to logout
        2. Remove cookie from the header
        """
        logout_response = self.rc.execute("PUT", self.__build_url("logout"), headers= self.headers, verify = self.verify)

        if logout_response.status_code == 204:
            self.headers.pop("Cookie")
            # print("INFO:", "Logged Out Successfully.")
            LOG.info("Logged Out Successfully.")
        else:
            # print("ERROR:", logout_response.content)
            LOG.error(logout_response.content)

    def get_all_ip_list(self) -> dict:
        """Get the IP Lists from the Forcepoint SMC API.

        :raises Exception: If the response is not 200.
        :return: List of ip addresses
        :rtype: list[str]
        """
        # self.login()
        iplist_response = self.rc.execute("GET", self.__build_url(f"elements/ip_list"), headers= self.headers, verify = self.verify)
        if iplist_response.status_code == 200:
            return iplist_response.json()
        else:
            msg = f"Could not fetch the ip list due to: {iplist_response.content}"
            raise Exception(msg)

    def get_all_ip_list_name(self, ip_lists, ip_list_name) -> dict:
        """Get the Specified IP list name"""

        for ip_list in ip_lists["result"]:
            if ip_list["name"] == ip_list_name:
                return ip_list
        return None
        
    def get_ip_list(self, ip_id_name : str) -> list:
        """Get the list of ip addresses from the Forcepoint SMC API.

        :raises Exception: If the response is not 200 or the response is not bytes.
        :return: List of ip addresses
        :rtype: list[str]
        """
        # self.login()
        ip_list = []
        msg = f"Inside the get_ip_list and {ip_id_name}"
        LOG.info(msg)

        response = self.get_all_ip_list()
        ip_name = self.get_all_ip_list_name(response, ip_id_name)

        if ip_name:
            href_res = ip_name["href"]
            # import pdb; pdb.set_trace()
            ip_id = href_res.split('/')[-1]
        else:
            msg = f"Could not fetch the ip name"
            LOG.error(msg)
            raise Exception(msg)
        
        iplist_response = self.rc.execute("GET",self.__build_url(f"elements/ip_list/{ip_id}/ip_address_list"), headers= self.headers, verify = self.verify)
        # iplist_response = self.rc.execute("GET",f"{href_res}/ip_address_list", headers= self.headers, verify = self.verify)
        if iplist_response.status_code == 200 and isinstance(iplist_response.content, bytes):
            # Write response bytes to the file
            tmp_dir_path = Path("/").joinpath("tmp")
            zip_file_path = tmp_dir_path.joinpath(f"{datetime.now().timestamp()}.zip")
            zip_file_path.write_bytes(iplist_response.content)
            # Unzip the file
            zip_file = zipfile.ZipFile(zip_file_path, "r")
            zip_file.extractall(tmp_dir_path)
            zip_file.close()
            # Read the content of the file
            content_path = tmp_dir_path.joinpath("ip_addresses")
            content = content_path.read_text(encoding="utf-8")
            ip_list = [line.strip() for line in content.splitlines() if line]
            # Get list of ip addresses
            LOG.info(f"Existing List of IP Addresses, ip_list_resp: {ip_list}")
            # Delete the zip file
            zip_file_path.unlink()
            # Delete Ip Addresses
            content_path.unlink()
        else:
            msg = f"Could not fetch the ip address list due to: {iplist_response.content}"
            LOG.error(msg)
            raise Exception(msg)
        return ip_list
    

    def write_ip_list(self, ip_list: list) -> None:
        """Write the ip address list to the Forcepoint SMC API.

        :param ip_list: List of ip addresses to be written to the Forcepoint SMC API.
        :type ip_list: list[str]
        """

        payload = json.dumps({"ip":ip_list})

        add_ip_id = self.rc.execute("POST", self.__build_url(f"elements/ip_list/{self.ip_list_id }/ip_address_list"), headers= self.headers, verify = self.verify, data=payload)

        if add_ip_id.status_code == 202 and isinstance(add_ip_id.content, bytes):
            LOG.info(f"IP address List updated succussfully for IP list: {self.ip_list_id }.")
        else:
            message = f"Could not update the ip address list for the IP list: {self.ip_list_id }"
            LOG.error(message)
            raise Exception(message)
        
    def block_ip(self, ip_id_name : str, ip_to_block: str) -> None:
        """Block the ip address in the Forcepoint SMC API.
        
        1. Login
        2. Get Ip List
        3. Add ip address to the list, provided it is not already present in the list
        4. Write updated ip list to Ip Address List endpoint
        5. Logout

        :param ip_to_block: Ip address to be blocked.
        :type ip_to_block: str
        """
        if not ip_to_block:
            raise Exception("Ip Address to be blocked is not provided.")

        # Get the new IP List
        new_ip_list = [ip.strip() for ip in ip_to_block.split(",") if ip]
        
        # Login
        self.login()
        
        # Get Ip List
        ip_list = self.get_ip_list(ip_id_name)
        # Get the difference between the new_ip_list and ip_list
        ip_to_block_list = list(set(new_ip_list) - set(ip_list))

        if ip_to_block_list:
            # Add ip address to the list
            ip_list.extend(ip_to_block_list)

            # Write IP List
            self.write_ip_list(ip_list)
            # print("INFO:", f"Successfully addedd {ip_to_block} ip into the block list")
            LOG.info(f"Successfully addedd {ip_to_block} ip into the block list")
        else:
            # print("ERROR:", f"Ip Address {ip_to_block} is already in the blocked list.")
            LOG.error(f"Ip Address {ip_to_block} is already in the blocked list.")

        # Logout
        self.logout()


    def unblock_ip(self, ip_id_name : str, ip_to_unblock: str) -> None:
        """Unblock the ip address in the Forcepoint SMC API.

        1. Login
        2. Get Ip List
        3. Remove Ip address from the list, provided it is present in the list
        4. Write updated ip list to Ip Address List endpoint
        5. Logout
        
        :param ip_to_unblock: Ip address to be unblocked.
        :type ip_to_unblock: str
        """
        if not ip_to_unblock:
            raise Exception("Ip Address to be unblocked is not provided.")
        
        # Get the new IP List
        new_ip_list = [ip.strip() for ip in ip_to_unblock.split(",") if ip]
        
        # login
        self.login()

        # Get IP List
        ip_list = self.get_ip_list(ip_id_name)
        # Get the intersection between the new_ip_list and ip_list
        ip_to_unblock_list = list(set(new_ip_list) & set(ip_list))

        if ip_to_unblock_list:
            # Remove Ip address from the list
            ip_list = list(set(ip_list) - set(ip_to_unblock_list))

            # Write IP List
            self.write_ip_list(ip_list)
            # print("INFO:", f"Successfully removed {ip_to_unblock} id from the block list")
            LOG.info(f"Successfully removed {ip_to_unblock} id from the block list")
        else:
            # print("ERROR:", f"Ip Address {ip_to_unblock} is not present in the blocked list.")
            LOG.error(f"Ip Address {ip_to_unblock} is not present in the blocked list.")
        # Logout
        self.logout()



    