
## Introduction
The following repository contains terraform code for a core networking module which provisions

- A singe Virtual Network
- A number Subnets
  - A single Network Security Group per subnet

This module is not for commercial use, and has purely been created for lab exercises and own use.

## Example Deployment
The `example/` folder contains an example configuration for deploying this module. The variables for this deployment can be found within the `vars/` folder.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuerm"></a> [azuerm](#provider\_azuerm) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_ids"></a> [nsg\_ids](#output\_nsg\_ids) | Zipmap output of Network Security Group IDs created by the module |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | Zipmap output of subnet IDs created by the module. |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The ID of the Virtual Network. |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The CIDR range of the Virtual Network to be deployed. | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | The IP addresses of the DNS servers for the Virtual Network. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | value | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to deploy the virtual network to. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Map of objects containing the subnet configurations for the virtual network.<br/><br/>    address\_prefix                                - CIDR value for the subnet.<br/>    private\_endpoint\_network\_policies             - Enable or disable network policies for private endpoint.<br/>    private\_link\_service\_network\_policies\_enabled - Enable or disable network policies for private link service. (Default False)<br/>    service\_endpoints                             - List of service endpoints to associate with the subnet.<br/>    delegation = { <br/>      name - The name of the delegation<br/>      service\_delegation = {<br/>        name    - The name of the service to delegate to<br/>        actions - A list of actions which should be delegated<br/>      }<br/>    } | <pre>map(object({<br/>    address_prefix                                = string<br/>    private_endpoint_network_policies             = optional(string, "Disabled")<br/>    private_link_service_network_policies_enabled = optional(bool, false)<br/>    service_endpoints                             = optional(list(string), [])<br/>    delegation = optional(object({<br/>      name = optional(string)<br/>      service_delegation = object({<br/>        name    = optional(string)<br/>        actions = optional(list(string), [])<br/>      })<br/>    }), null)<br/>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value | `map(any)` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network. | `string` | n/a | yes |  
