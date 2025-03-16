## Common Variables
###########################
variable "service" {
  type = string
  validation {
    condition     = can(regexall("^[a-z]{1,4}$", var.service))
    error_message = "Service must be a lower case letter and no longer than 3 characters"
  }
  description = "Service name for the configuration."
}

variable "location" {
  type = string
  validation {
    condition = contains([
      "uksouth",
      "ukwest"
    ], var.location)
    error_message = "The location must be either 'uksouth' or 'ukwest'"
  }
  description = "The location value for the deployment."
}

variable "environment_code" {
  type = string
  validation {
    condition = contains([
      "dev",
      "tst"
    ], var.environment_code)
    error_message = "Environment code must be either 'dev', or 'tst'."
  }
  description = "The short code for the deployed environment."
}

## Networking Variables
###########################
variable "virtual_network_cidr" {
  type        = string
  description = "Virtual Network CIDR to be deployed."
}

variable "dns_servers" {
  type        = list(string)
  description = "The IP addresses of the DNS servers for the Virtual Network."
  default     = []
}

variable "subnets" {
  type = map(object({
    address_prefix                                = string
    private_endpoint_network_policies             = optional(string, "Disabled")
    private_link_service_network_policies_enabled = optional(bool, false)
    service_endpoints                             = optional(list(string), [])
    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }))
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