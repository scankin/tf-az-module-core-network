module "core_network" {
  source = "../"

  virtual_network_name = local.virtual_network_name
  resource_group_name  = azurerm_resource_group.this.name
  location             = var.location

  address_space = var.virtual_network_cidr
  dns_servers   = var.dns_servers
  subnets       = var.subnets

  tags = local.tags
}