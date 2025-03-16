output "virtual_network_id" {
  description = "The ID of the Virtual Network."
  value       = module.core_network.virtual_network_id
}

output "subnet_ids" {
  description = "Map output of subnet IDs created by the module."
  value       = module.core_network.subnet_ids
}

output "private_endpoint_subnet_id" {
  description = "Private Endpoint Subnet ID"
  value       = module.core_network.subnet_ids["pe"]
}

output "web_subnet_id" {
  description = "Web Subnet ID"
  value       = module.core_network.subnet_ids["web"]
}

output "nsg_ids" {
  description = "The IDs of the Network Security Groups created by the module"
  value       = module.core_network.nsg_ids
}