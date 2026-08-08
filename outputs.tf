output "virtual_network_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "subnets" {
  description = "Zipmap output of subnet IDs created by the module."
  value       = azurerm_subnet.this
}

output "nsgs" {
  description = "The network security groups created by the module."
  value       = azurerm_network_security_group.this
}