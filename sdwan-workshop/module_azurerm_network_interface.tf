locals {
  network_interfaces = merge(local.hub_network_interfaces, local.branch_network_interfaces, local.spoke_network_interfaces)
}

module "module_azurerm_network_interface" {
  for_each = local.network_interfaces

  source = "../azure/rm/azurerm_network_interface"

  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  name                          = each.value.name
  enable_ip_forwarding          = each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking

  ip_configurations = each.value.ip_configurations
}

output "network_interfaces" {
  value = module.module_azurerm_network_interface[*]
}
