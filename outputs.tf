output "virtual_network_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Map output of subnet IDs created by the module."
  value       = { for v in variables.subnets : v.key => { id = azurerm_subnet.azurerm_subnet.this[v.key].id } }
}