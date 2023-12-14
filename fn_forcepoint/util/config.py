# -*- coding: utf-8 -*-
# Generated with resilient-sdk v49.1.51

"""Generate a default configuration-file section for fn_forcepoint"""


def config_section_data():
    """
    Produce add the default configuration section to app.config,
    for fn_forcepoint when called by `resilient-circuits config [-c|-u]`
    """
    config_data = None

    config_data = u"""[fn_forcepoint]

forcepoint_host=https://15.206.252.188:8082
api_key=fxH89w5dDFpooEBppfcuDQbFs
"""
    return config_data
