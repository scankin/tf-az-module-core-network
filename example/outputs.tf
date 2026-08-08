output "virtual_network_id" {
  description = "The ID of the Virtual Network."
  value       = module.core_network.virtual_network_id
}

output "subnet_ids" {
  description = "Map output of subnet IDs created by the module."
  value       = module.core_network.subnet_ids
}

output "nsgs" {
  description = "A map containing the information of the NSGs deployed by the module"
  value       = module.core_network.nsgs
}