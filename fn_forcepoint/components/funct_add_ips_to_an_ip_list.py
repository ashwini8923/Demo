# -*- coding: utf-8 -*-
# Generated with resilient-sdk v49.1.51

"""AppFunction implementation"""

import json
from resilient_circuits import AppFunctionComponent, app_function, FunctionResult
from resilient_lib import IntegrationError, validate_fields

from fn_forcepoint.util.forcepoint import ForcepointSmcClient

PACKAGE_NAME = "fn_forcepoint"
FN_NAME = "add_ips_to_an_ip_list"


class FunctionComponent(AppFunctionComponent):
    """Component that implements function 'add_ips_to_an_ip_list'"""

    def __init__(self, opts):
        super(FunctionComponent, self).__init__(opts, PACKAGE_NAME)

    @app_function(FN_NAME)
    def _app_function(self, fn_inputs):
        """
        Function: None
        Inputs:
            -   fn_inputs.ip_result_list
        """

        yield self.status_message(f"Starting App Function: '{FN_NAME}'")

        self.LOG.info("fn_inputs: %s", fn_inputs)

        # Example validating required fn_inputs
        validate_fields(["ip_result_list"], fn_inputs)
        self.LOG.info(f"fn_inputs---> {fn_inputs}")

        ip_result_list=json.loads(fn_inputs.ip_result_list)['content']
        validate_fields(["fp_ip_address_list","fp_ip_list_name"], ip_result_list)

        fn_msg = self.get_fn_msg()
        self.LOG.info("fn_msg: %s", fn_msg)

        fp_smc_client = ForcepointSmcClient(self.opts, self.app_configs)
        fp_smc_client.login()

        self.LOG.info(f"ip_result_list: {ip_result_list}")

        response = fp_smc_client.add_ip_address_list(ip_result_list["fp_ip_list_name"], ip_result_list['ip_address_list'])

        yield self.status_message(f"Finished running App Function: '{FN_NAME}'")

        yield FunctionResult(response)