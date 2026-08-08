locals {
    managed_subnet_names = [
        "GatewaySubnet",
        "AzureFirewallSubnet",
        "AzureFirewallManagementSubnet",
        "AzureBastionSubnet",
        "RouteServerSubnet"
    ]
}