# -*- coding: utf-8 -*-
# Generated with resilient-sdk v49.1.51

"""Generate the Resilient customizations required for fn_forcepoint"""

import base64
import os
import io
try:
    from resilient import ImportDefinition
except ImportError:
    # Support Apps running on resilient-circuits < v35.0.195
    from resilient_circuits.util import ImportDefinition

RES_FILE = "data/export.res"


def codegen_reload_data():
    """
    Parameters required reload codegen for the fn_forcepoint package
    """
    return {
        "package": u"fn_forcepoint",
        "message_destinations": [u"forcepoint_ngfw_new_destination"],
        "functions": [u"add_ips_to_an_ip_list", u"get_ip_addresses_in_an_ip_list"],
        "workflows": [u"fn_block_ip", u"fn_unblock_ip"],
        "actions": [],
        "incident_fields": [],
        "incident_artifact_types": [],
        "incident_types": [],
        "datatables": [],
        "automatic_tasks": [],
        "scripts": [],
        "playbooks": []
    }


def customization_data(client=None):
    """
    Returns a Generator of ImportDefinitions (Customizations).
    Install them using `resilient-circuits customize`

    IBM SOAR Platform Version: 49.1.52

    Contents:
    - Message Destinations:
        - forcepoint_ngfw_new_destination
    - Functions:
        - add_ips_to_an_ip_list
        - get_ip_addresses_in_an_ip_list
    - Workflows:
        - fn_block_ip
        - fn_unblock_ip
    """

    res_file = os.path.join(os.path.dirname(__file__), RES_FILE)
    if not os.path.isfile(res_file):
        raise FileNotFoundError("{} not found".format(RES_FILE))

    with io.open(res_file, mode='rt') as f:
        b64_data = base64.b64encode(f.read().encode('utf-8'))
        yield ImportDefinition(b64_data)