output "id" {
  value       = azurerm_resource_group.resource_group.id
  description = "Specifies the name of the AKS cluster."
}

output "resource_group_name" {
  value       = azurerm_resource_group.resource_group.name
  description = "value of the resource group where the AKS cluster is deployed."
}
