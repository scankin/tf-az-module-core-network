## Common Variables
###########################
service          = "demo"
location         = "uksouth"
environment_code = "dev"

## Networking Variables
###########################
virtual_network_cidr = "10.0.0.0/16"

subnets = {
  web = {
    address_prefix = "10.0.0.0/27"
    delegation = {
      name = "web-service-delegation"
      service_delegation = {
        name = "Microsoft.ContainerInstance/containerGroups"
      }
    }
  },
  pe = {
    address_prefix                                = "10.0.0.32/29"
    private_link_service_network_policies_enabled = true
  },

}

dns_servers = ["10.0.0.0", "10.0.0.1"]
