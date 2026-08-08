output "virtual_network_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Zipmap output of subnet IDs created by the module."
  value       = zipmap([for k, v in var.subnets : k], [for k, v in var.subnets : azurerm_subnet.this[k].id])
}

output "nsgs" {
  description = "The network security groups created by the module."
  value       = azurerm_network_security_group.this
}