locals {
  network_rg = var.vnet_rg_name != "" ? var.vnet_rg_name : var.resource_group_name
}

# Importing existing subnet
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = local.network_rg
}

