## Common Variables
##################################
variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to deploy the virtual network to."
}

variable "location" {
  type        = string
  description = "value"
}

variable "tags" {
  type        = map(any)
  description = "value"
}

## Virtual Network Variables
################################
variable "address_space" {
  type = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/[0-9]{1,2})$", var.address_space))
    error_message = "VNet CIDR range is invalid."
  }
  description = "The CIDR range of the Virtual Network to be deployed."
}

variable "dns_servers" {
  type        = list(string)
  description = "The IP addresses of the DNS servers for the Virtual Network."
  default     = []
}

## Subnet Variables
################################
variable "subnets" {
  type = map(object({
    address_prefix                                = string
    private_endpoint_network_policies             = optional(string, "")
    private_link_service_network_policies_enabled = optional(bool, false)
    service_endpoints                             = optional(list(string), [])
    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }), {})
  }))
  description = <<DESC
    Map of objects containing the subnet configurations for the virtual network.

    address_prefix                                - CIDR value for the subnet.
    private_endpoint_network_policies             - Enable or disable network policies for private endpoint.
    private_link_service_network_policies_enabled - Enable or disable network policies for private link service. (Default False)
    service_endpoints                             - List of service endpoints to associate with the subnet.
    delegation = { 
      name - The name of the delegation
      service_delegation = {
        name    - The name of the service to delegate to
        actions - A list of actions which should be delegated
      }
    }
  DESC
  default     = {}
}
