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
  description = "The value of the location for the Virtual Network to be deployed"
}

variable "tags" {
  type        = map(any)
  description = "Map value of key:pair values indicating tags"
  default = {
    terraform = "true"
  }
}

## Virtual Network Variables
################################
variable "address_space" {
  type = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/[0-9]{1,2})$", var.address_space))
    error_message = "${var.address_space} is not a valid CIDR range."
  }
  description = "The CIDR range of the Virtual Network to be deployed."
}

variable "dns_servers" {
  type        = list(string)
  description = "The IP addresses of the DNS servers for the Virtual Network."
  validation {
    condition = alltrue([
      for v in var.dns_servers : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}$", v))
    ])
    error_message = "Each value must be a valid IP address"
  }
  default = []
}

## Subnet Variables
################################
variable "subnets" {
  type = map(object({
    address_prefix                                = string
    private_endpoint_network_policies             = optional(string, "Disabled")
    private_link_service_network_policies_enabled = optional(bool, false)
    service_endpoints                             = optional(list(string), [])
    delegation = optional(object({
      name = optional(string)
      service_delegation = object({
        name    = optional(string)
        actions = optional(list(string), [])
      })
    }), null)
  }))
  validation {
    condition = alltrue([
      for k in var.subnets : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/[0-9]{1,2})$", k.address_prefix))
    ])
    error_message = "Subnet address prefix must be a valid CIDR range."
  }
  validation {
    condition = alltrue([
      for k in var.subnets : contains([
        "Disabled",
        "Enabled",
        "NetworkSecurityGroupEnabled",
        "RouteTableEnabled"
      ], k.private_endpoint_network_policies)
    ])
    error_message = "Private Endpoint Network Policies must be 'Disabled', 'Enabled', 'NetworkSecurityGroupEnabled or 'RouteTableEnabled'."
  }
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
