# -*- coding: utf-8 -*-
# Generated with resilient-sdk v49.1.51

"""AppFunction implementation"""

from resilient_circuits import AppFunctionComponent, app_function, FunctionResult
from resilient_lib import validate_fields

from fn_forcepoint.util.forcepoint import ForcepointSmcClient

PACKAGE_NAME = "fn_forcepoint"
FN_NAME = "get_ip_addresses_in_an_ip_list"


class FunctionComponent(AppFunctionComponent):
    """Component that implements function 'get_ip_addresses_in_an_ip_list'"""

    def __init__(self, opts):
        super(FunctionComponent, self).__init__(opts, PACKAGE_NAME)

    @app_function(FN_NAME)
    def _app_function(self, fn_inputs):
        """
        Function: for testing
        Inputs:
            -   fn_inputs.fp_ip_address_list
            -   fn_inputs.fp_ip_list_name
            -   fn_inputs.fp_action
        """

        yield self.status_message(f"Starting App Function: '{FN_NAME}'")

        validate_fields(["fp_ip_address_list", "fp_ip_list_name", "fp_action"], fn_inputs)
        self.LOG.info(fn_inputs)

        fn_msg = self.get_fn_msg()
        self.LOG.info("fn_msg: %s", fn_msg)

        fp_smc_client = ForcepointSmcClient(self.opts, self.app_configs)
        # fp_smc_client.login()
        
        # fp_ip_list_name=self.get_select_param(getattr(fn_inputs, "fp_ip_list_name", None))
        # fp_ip_address_list=self.get_select_param(getattr(fn_inputs, "fp_ip_address_list", None))

        response = fp_smc_client.get_ip_list(fn_inputs.fp_ip_list_name)
        if fn_inputs.fp_action == "block":
            # response["ip"].append(fn_inputs.fp_ip_address_list)
            fp_smc_client.block_ip(fn_inputs.fp_ip_list_name, fn_inputs.fp_ip_address_list)
        else:
            if fn_inputs.fp_ip_address_list in response["ip"]:
                # response["ip"].remove(fn_inputs.fp_ip_address_list)
                fp_smc_client.unblock_ip(fn_inputs.fp_ip_list_name, fn_inputs.fp_ip_address_list)
        result_list = {
            "fp_ip_list_name": fn_inputs.fp_ip_list_name,
            "ip_address_list": response
        }

        yield self.status_message(f"Endpoint reached successfully and returning results for App Function: '{FN_NAME}'")


        yield self.status_message(f"Finished running App Function: '{FN_NAME}'")


        yield FunctionResult(result_list)
