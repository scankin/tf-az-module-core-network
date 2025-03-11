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
  type        = string
  description = "The CIDR range of the Virtual Network to be deployed."
}

variable "dns_servers" {
  type        = list(string)
  description = "The IP addresses of the DNS servers for the Virtual Network."
}

## Subnet Variables
################################
variable "subnets" {
  type = map(object({
    address_prefix                                = string
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoints                             = optional(list(string))
    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }), {})
  }))
}
