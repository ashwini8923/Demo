{
  "action_order": [],
  "actions": [],
  "apps": [],
  "automatic_tasks": [],
  "case_matching_profiles": [],
  "export_date": 1697015906181,
  "export_format_version": 2,
  "export_type": null,
  "fields": [
    {
      "allow_default_value": false,
      "blank_option": false,
      "calculated": false,
      "changeable": true,
      "chosen": false,
      "default_chosen_by_server": false,
      "deprecated": false,
      "export_key": "__function/ip_result_list",
      "hide_notification": false,
      "id": 398,
      "input_type": "text",
      "internal": false,
      "is_tracked": false,
      "name": "ip_result_list",
      "operation_perms": {},
      "operations": [],
      "placeholder": "",
      "prefix": null,
      "read_only": false,
      "required": "always",
      "rich_text": false,
      "tags": [],
      "templates": [],
      "text": "ip_result_list",
      "tooltip": "ip list name along with ip addresses",
      "type_id": 11,
      "uuid": "93b17aa7-cebc-4236-b5f7-c78fd7c3dc00",
      "values": []
    },
    {
      "allow_default_value": false,
      "blank_option": false,
      "calculated": false,
      "changeable": true,
      "chosen": false,
      "default_chosen_by_server": false,
      "deprecated": false,
      "export_key": "__function/fp_ip_address_list",
      "hide_notification": false,
      "id": 399,
      "input_type": "text",
      "internal": false,
      "is_tracked": false,
      "name": "fp_ip_address_list",
      "operation_perms": {},
      "operations": [],
      "placeholder": "",
      "prefix": null,
      "read_only": false,
      "required": "always",
      "rich_text": false,
      "tags": [],
      "templates": [],
      "text": "fp_ip_address_list",
      "tooltip": "list of ip addresses",
      "type_id": 11,
      "uuid": "15a15eaf-7696-46db-a584-1660d472c5ba",
      "values": []
    },
    {
      "allow_default_value": false,
      "blank_option": false,
      "calculated": false,
      "changeable": true,
      "chosen": false,
      "default_chosen_by_server": false,
      "deprecated": false,
      "export_key": "__function/fp_ip_list_name",
      "hide_notification": false,
      "id": 407,
      "input_type": "text",
      "internal": false,
      "is_tracked": false,
      "name": "fp_ip_list_name",
      "operation_perms": {},
      "operations": [],
      "placeholder": "",
      "prefix": null,
      "read_only": false,
      "required": "always",
      "rich_text": false,
      "tags": [],
      "templates": [],
      "text": "fp_ip_list_name",
      "tooltip": "ip list name",
      "type_id": 11,
      "uuid": "276e0e83-06b7-48d2-8e27-f9974e21c63a",
      "values": []
    },
    {
      "allow_default_value": false,
      "blank_option": false,
      "calculated": false,
      "changeable": true,
      "chosen": false,
      "default_chosen_by_server": false,
      "deprecated": false,
      "export_key": "__function/fp_action",
      "hide_notification": false,
      "id": 371,
      "input_type": "text",
      "internal": false,
      "is_tracked": false,
      "name": "fp_action",
      "operation_perms": {},
      "operations": [],
      "placeholder": "",
      "prefix": null,
      "read_only": false,
      "required": "always",
      "rich_text": false,
      "tags": [],
      "templates": [],
      "text": "fp_action",
      "tooltip": "action to block or unblock",
      "type_id": 11,
      "uuid": "3ebd4f12-3511-4f29-a5bf-255fb111da8b",
      "values": []
    },
    {
      "export_key": "incident/internal_customizations_field",
      "id": 0,
      "input_type": "text",
      "internal": true,
      "name": "internal_customizations_field",
      "read_only": true,
      "text": "Customizations Field (internal)",
      "type_id": 0,
      "uuid": "bfeec2d4-3770-11e8-ad39-4a0004044aa1"
    }
  ],
  "functions": [
    {
      "created_date": 1697014670458,
      "description": {
        "content": null,
        "format": "text"
      },
      "destination_handle": "forcepoint_ngfw_new_destination",
      "display_name": "add_ips_to_an_ip_list",
      "export_key": "add_ips_to_an_ip_list",
      "id": 103,
      "last_modified_by": {
        "display_name": "rahul shelke",
        "id": 2,
        "name": "rahul.shelke@sacumen.com",
        "type": "user"
      },
      "last_modified_time": 1697014670458,
      "name": "add_ips_to_an_ip_list",
      "output_description": {
        "content": null,
        "format": "text"
      },
      "tags": [],
      "uuid": "98c82f45-e358-4d71-a476-3e02bc756c7e",
      "version": 0,
      "view_items": [
        {
          "content": "93b17aa7-cebc-4236-b5f7-c78fd7c3dc00",
          "element": "field_uuid",
          "field_type": "__function",
          "show_if": null,
          "show_link_header": false,
          "step_label": null
        }
      ],
      "workflows": [
        {
          "actions": [],
          "description": null,
          "name": "fn_block_ip",
          "object_type": "incident",
          "programmatic_name": "fn_block_ip",
          "tags": [],
          "uuid": null,
          "workflow_id": 77
        },
        {
          "actions": [],
          "description": null,
          "name": "fn_unblock_ip",
          "object_type": "incident",
          "programmatic_name": "fn_unblock_ip",
          "tags": [],
          "uuid": null,
          "workflow_id": 78
        }
      ]
    },
    {
      "created_date": 1697014499270,
      "description": {
        "content": "for testing",
        "format": "text"
      },
      "destination_handle": "forcepoint_ngfw_new_destination",
      "display_name": "get_ip_addresses_in_an_ip_list",
      "export_key": "get_ip_addresses_in_an_ip_list",
      "id": 102,
      "last_modified_by": {
        "display_name": "rahul shelke",
        "id": 2,
        "name": "rahul.shelke@sacumen.com",
        "type": "user"
      },
      "last_modified_time": 1697014499270,
      "name": "get_ip_addresses_in_an_ip_list",
      "output_description": {
        "content": null,
        "format": "text"
      },
      "tags": [],
      "uuid": "a32ce286-23b9-4a2b-a23a-6be4d4b4eece",
      "version": 0,
      "view_items": [
        {
          "content": "15a15eaf-7696-46db-a584-1660d472c5ba",
          "element": "field_uuid",
          "field_type": "__function",
          "show_if": null,
          "show_link_header": false,
          "step_label": null
        },
        {
          "content": "276e0e83-06b7-48d2-8e27-f9974e21c63a",
          "element": "field_uuid",
          "field_type": "__function",
          "show_if": null,
          "show_link_header": false,
          "step_label": null
        },
        {
          "content": "3ebd4f12-3511-4f29-a5bf-255fb111da8b",
          "element": "field_uuid",
          "field_type": "__function",
          "show_if": null,
          "show_link_header": false,
          "step_label": null
        }
      ],
      "workflows": [
        {
          "actions": [],
          "description": null,
          "name": "fn_block_ip",
          "object_type": "incident",
          "programmatic_name": "fn_block_ip",
          "tags": [],
          "uuid": null,
          "workflow_id": 77
        },
        {
          "actions": [],
          "description": null,
          "name": "fn_unblock_ip",
          "object_type": "incident",
          "programmatic_name": "fn_unblock_ip",
          "tags": [],
          "uuid": null,
          "workflow_id": 78
        }
      ]
    }
  ],
  "geos": null,
  "groups": null,
  "id": 53,
  "inbound_destinations": [],
  "inbound_mailboxes": null,
  "incident_artifact_types": [],
  "incident_types": [
    {
      "create_date": 1697015904514,
      "description": "Customization Packages (internal)",
      "enabled": false,
      "export_key": "Customization Packages (internal)",
      "hidden": false,
      "id": 0,
      "name": "Customization Packages (internal)",
      "parent_id": null,
      "system": false,
      "update_date": 1697015904514,
      "uuid": "bfeec2d4-3770-11e8-ad39-4a0004044aa0"
    }
  ],
  "layouts": [],
  "locale": null,
  "message_destinations": [
    {
      "api_keys": [],
      "destination_type": 0,
      "expect_ack": true,
      "export_key": "forcepoint_ngfw_new_destination",
      "name": "forcepoint_ngfw_new_destination",
      "programmatic_name": "forcepoint_ngfw_new_destination",
      "tags": [],
      "users": [],
      "uuid": "a7519a73-9686-4ac1-86c0-223a753b84e2"
    }
  ],
  "notifications": null,
  "overrides": null,
  "phases": [],
  "playbooks": [],
  "regulators": null,
  "roles": [],
  "scripts": [],
  "server_version": {
    "build_number": 52,
    "major": 49,
    "minor": 1,
    "version": "49.1.52"
  },
  "tags": [],
  "task_order": [],
  "timeframes": null,
  "types": [],
  "workflows": [
    {
      "actions": [],
      "content": {
        "version": 2,
        "workflow_id": "fn_unblock_ip",
        "xml": "\u003c?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?\u003e\u003cdefinitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:resilient=\"http://resilient.ibm.com/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" targetNamespace=\"http://www.camunda.org/test\"\u003e\u003cprocess id=\"fn_unblock_ip\" isExecutable=\"true\" name=\"fn_unblock_ip\"\u003e\u003cdocumentation\u003eunblock an ip\u003c/documentation\u003e\u003cstartEvent id=\"StartEvent_155asxm\"\u003e\u003coutgoing\u003eSequenceFlow_1os1hln\u003c/outgoing\u003e\u003c/startEvent\u003e\u003cserviceTask id=\"ServiceTask_135zxaz\" name=\"get_ip_addresses_in_an_ip_list\" resilient:type=\"function\"\u003e\u003cextensionElements\u003e\u003cresilient:function uuid=\"a32ce286-23b9-4a2b-a23a-6be4d4b4eece\"\u003e{\"inputs\":{},\"pre_processing_script\":\"inputs.fp_ip_list_name = incident.name\\ninputs.fp_ip_address_list = incident.addr\\ninputs.fp_action = incident.description\",\"pre_processing_script_language\":\"python3\",\"result_name\":\"ip_result_list\"}\u003c/resilient:function\u003e\u003c/extensionElements\u003e\u003cincoming\u003eSequenceFlow_1os1hln\u003c/incoming\u003e\u003coutgoing\u003eSequenceFlow_1glx8n0\u003c/outgoing\u003e\u003c/serviceTask\u003e\u003csequenceFlow id=\"SequenceFlow_1os1hln\" sourceRef=\"StartEvent_155asxm\" targetRef=\"ServiceTask_135zxaz\"/\u003e\u003cserviceTask id=\"ServiceTask_1bpa8m3\" name=\"add_ips_to_an_ip_list\" resilient:type=\"function\"\u003e\u003cextensionElements\u003e\u003cresilient:function uuid=\"98c82f45-e358-4d71-a476-3e02bc756c7e\"\u003e{\"inputs\":{},\"pre_processing_script\":\"inputs.ip_result_list = workflow.properties.ip_result_list\",\"pre_processing_script_language\":\"python3\",\"result_name\":\"\"}\u003c/resilient:function\u003e\u003c/extensionElements\u003e\u003cincoming\u003eSequenceFlow_1glx8n0\u003c/incoming\u003e\u003c/serviceTask\u003e\u003csequenceFlow id=\"SequenceFlow_1glx8n0\" sourceRef=\"ServiceTask_135zxaz\" targetRef=\"ServiceTask_1bpa8m3\"/\u003e\u003ctextAnnotation id=\"TextAnnotation_1kxxiyt\"\u003e\u003ctext\u003eStart your workflow here\u003c/text\u003e\u003c/textAnnotation\u003e\u003cassociation id=\"Association_1seuj48\" sourceRef=\"StartEvent_155asxm\" targetRef=\"TextAnnotation_1kxxiyt\"/\u003e\u003c/process\u003e\u003cbpmndi:BPMNDiagram id=\"BPMNDiagram_1\"\u003e\u003cbpmndi:BPMNPlane bpmnElement=\"undefined\" id=\"BPMNPlane_1\"\u003e\u003cbpmndi:BPMNShape bpmnElement=\"StartEvent_155asxm\" id=\"StartEvent_155asxm_di\"\u003e\u003comgdc:Bounds height=\"36\" width=\"36\" x=\"162\" y=\"188\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"0\" width=\"90\" x=\"157\" y=\"223\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNShape bpmnElement=\"TextAnnotation_1kxxiyt\" id=\"TextAnnotation_1kxxiyt_di\"\u003e\u003comgdc:Bounds height=\"30\" width=\"100\" x=\"99\" y=\"254\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"Association_1seuj48\" id=\"Association_1seuj48_di\"\u003e\u003comgdi:waypoint x=\"169\" y=\"220\"/\u003e\u003comgdi:waypoint x=\"153\" y=\"254\"/\u003e\u003c/bpmndi:BPMNEdge\u003e\u003cbpmndi:BPMNShape bpmnElement=\"ServiceTask_135zxaz\" id=\"ServiceTask_135zxaz_di\"\u003e\u003comgdc:Bounds height=\"80\" width=\"100\" x=\"248\" y=\"166\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"SequenceFlow_1os1hln\" id=\"SequenceFlow_1os1hln_di\"\u003e\u003comgdi:waypoint x=\"198\" y=\"206\"/\u003e\u003comgdi:waypoint x=\"248\" y=\"206\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"223\" y=\"185\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNEdge\u003e\u003cbpmndi:BPMNShape bpmnElement=\"ServiceTask_1bpa8m3\" id=\"ServiceTask_1bpa8m3_di\"\u003e\u003comgdc:Bounds height=\"80\" width=\"100\" x=\"398\" y=\"166\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"SequenceFlow_1glx8n0\" id=\"SequenceFlow_1glx8n0_di\"\u003e\u003comgdi:waypoint x=\"348\" y=\"206\"/\u003e\u003comgdi:waypoint x=\"398\" y=\"206\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"373\" y=\"185\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNEdge\u003e\u003c/bpmndi:BPMNPlane\u003e\u003c/bpmndi:BPMNDiagram\u003e\u003c/definitions\u003e"
      },
      "content_version": 2,
      "description": "unblock an ip",
      "export_key": "fn_unblock_ip",
      "last_modified_by": "rahul.shelke@sacumen.com",
      "last_modified_time": 1697015387441,
      "name": "fn_unblock_ip",
      "object_type": "incident",
      "programmatic_name": "fn_unblock_ip",
      "tags": [],
      "uuid": "aa0f7a81-58c9-44f2-a8f1-6c6429e2e13b",
      "workflow_id": 78
    },
    {
      "actions": [],
      "content": {
        "version": 4,
        "workflow_id": "fn_block_ip",
        "xml": "\u003c?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?\u003e\u003cdefinitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:resilient=\"http://resilient.ibm.com/bpmn\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" targetNamespace=\"http://www.camunda.org/test\"\u003e\u003cprocess id=\"fn_block_ip\" isExecutable=\"true\" name=\"fn_block_ip\"\u003e\u003cdocumentation\u003eblocking an ip.\u003c/documentation\u003e\u003cstartEvent id=\"StartEvent_155asxm\"\u003e\u003coutgoing\u003eSequenceFlow_1w6381t\u003c/outgoing\u003e\u003c/startEvent\u003e\u003cserviceTask id=\"ServiceTask_1dl8o6g\" name=\"get_ip_addresses_in_an_ip_list\" resilient:type=\"function\"\u003e\u003cextensionElements\u003e\u003cresilient:function uuid=\"a32ce286-23b9-4a2b-a23a-6be4d4b4eece\"\u003e{\"inputs\":{},\"pre_processing_script\":\"inputs.fp_ip_list_name = incident.name\\ninputs.fp_ip_address_list = incident.addr\\ninputs.fp_action = incident.description\",\"pre_processing_script_language\":\"python3\",\"result_name\":\"ip_result_list\"}\u003c/resilient:function\u003e\u003c/extensionElements\u003e\u003cincoming\u003eSequenceFlow_1w6381t\u003c/incoming\u003e\u003coutgoing\u003eSequenceFlow_1katzn5\u003c/outgoing\u003e\u003c/serviceTask\u003e\u003csequenceFlow id=\"SequenceFlow_1w6381t\" sourceRef=\"StartEvent_155asxm\" targetRef=\"ServiceTask_1dl8o6g\"/\u003e\u003cserviceTask id=\"ServiceTask_1ho3p4d\" name=\"add_ips_to_an_ip_list\" resilient:type=\"function\"\u003e\u003cextensionElements\u003e\u003cresilient:function uuid=\"98c82f45-e358-4d71-a476-3e02bc756c7e\"\u003e{\"inputs\":{},\"pre_processing_script\":\"inputs.ip_result_list = workflow.properties.ip_result_list\",\"pre_processing_script_language\":\"python3\"}\u003c/resilient:function\u003e\u003c/extensionElements\u003e\u003cincoming\u003eSequenceFlow_1katzn5\u003c/incoming\u003e\u003coutgoing\u003eSequenceFlow_1883l5k\u003c/outgoing\u003e\u003c/serviceTask\u003e\u003csequenceFlow id=\"SequenceFlow_1katzn5\" sourceRef=\"ServiceTask_1dl8o6g\" targetRef=\"ServiceTask_1ho3p4d\"/\u003e\u003cendEvent id=\"EndEvent_1cdh9ut\"\u003e\u003cincoming\u003eSequenceFlow_1883l5k\u003c/incoming\u003e\u003c/endEvent\u003e\u003csequenceFlow id=\"SequenceFlow_1883l5k\" sourceRef=\"ServiceTask_1ho3p4d\" targetRef=\"EndEvent_1cdh9ut\"/\u003e\u003ctextAnnotation id=\"TextAnnotation_1kxxiyt\"\u003e\u003ctext\u003eStart your workflow here\u003c/text\u003e\u003c/textAnnotation\u003e\u003cassociation id=\"Association_1seuj48\" sourceRef=\"StartEvent_155asxm\" targetRef=\"TextAnnotation_1kxxiyt\"/\u003e\u003c/process\u003e\u003cbpmndi:BPMNDiagram id=\"BPMNDiagram_1\"\u003e\u003cbpmndi:BPMNPlane bpmnElement=\"undefined\" id=\"BPMNPlane_1\"\u003e\u003cbpmndi:BPMNShape bpmnElement=\"StartEvent_155asxm\" id=\"StartEvent_155asxm_di\"\u003e\u003comgdc:Bounds height=\"36\" width=\"36\" x=\"162\" y=\"188\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"0\" width=\"90\" x=\"157\" y=\"223\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNShape bpmnElement=\"TextAnnotation_1kxxiyt\" id=\"TextAnnotation_1kxxiyt_di\"\u003e\u003comgdc:Bounds height=\"30\" width=\"100\" x=\"99\" y=\"254\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"Association_1seuj48\" id=\"Association_1seuj48_di\"\u003e\u003comgdi:waypoint x=\"169\" y=\"220\"/\u003e\u003comgdi:waypoint x=\"153\" y=\"254\"/\u003e\u003c/bpmndi:BPMNEdge\u003e\u003cbpmndi:BPMNShape bpmnElement=\"ServiceTask_1dl8o6g\" id=\"ServiceTask_1dl8o6g_di\"\u003e\u003comgdc:Bounds height=\"80\" width=\"100\" x=\"248\" y=\"166\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"SequenceFlow_1w6381t\" id=\"SequenceFlow_1w6381t_di\"\u003e\u003comgdi:waypoint x=\"198\" y=\"206\"/\u003e\u003comgdi:waypoint x=\"248\" y=\"206\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"223\" y=\"185\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNEdge\u003e\u003cbpmndi:BPMNShape bpmnElement=\"ServiceTask_1ho3p4d\" id=\"ServiceTask_1ho3p4d_di\"\u003e\u003comgdc:Bounds height=\"80\" width=\"100\" x=\"398\" y=\"166\"/\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"SequenceFlow_1katzn5\" id=\"SequenceFlow_1katzn5_di\"\u003e\u003comgdi:waypoint x=\"348\" y=\"206\"/\u003e\u003comgdi:waypoint x=\"398\" y=\"206\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"373\" y=\"185\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNEdge\u003e\u003cbpmndi:BPMNShape bpmnElement=\"EndEvent_1cdh9ut\" id=\"EndEvent_1cdh9ut_di\"\u003e\u003comgdc:Bounds height=\"36\" width=\"36\" x=\"548\" y=\"188\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"566\" y=\"228\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNShape\u003e\u003cbpmndi:BPMNEdge bpmnElement=\"SequenceFlow_1883l5k\" id=\"SequenceFlow_1883l5k_di\"\u003e\u003comgdi:waypoint x=\"498\" y=\"206\"/\u003e\u003comgdi:waypoint x=\"548\" y=\"206\"/\u003e\u003cbpmndi:BPMNLabel\u003e\u003comgdc:Bounds height=\"12\" width=\"0\" x=\"523\" y=\"185\"/\u003e\u003c/bpmndi:BPMNLabel\u003e\u003c/bpmndi:BPMNEdge\u003e\u003c/bpmndi:BPMNPlane\u003e\u003c/bpmndi:BPMNDiagram\u003e\u003c/definitions\u003e"
      },
      "content_version": 4,
      "description": "blocking an ip.",
      "export_key": "fn_block_ip",
      "last_modified_by": "rahul.shelke@sacumen.com",
      "last_modified_time": 1697015123583,
      "name": "fn_block_ip",
      "object_type": "incident",
      "programmatic_name": "fn_block_ip",
      "tags": [],
      "uuid": "fc0e8b42-8a0d-400f-b69d-95272d7bfa79",
      "workflow_id": 77
    }
  ],
  "workspaces": []
}
