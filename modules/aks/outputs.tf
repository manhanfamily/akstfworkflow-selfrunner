output "name" {
  value       = azurerm_kubernetes_cluster.aks-cluster.name
  description = "Specifies the name of the AKS cluster."
}

output "resource_group" {
  value       = azurerm_kubernetes_cluster.aks-cluster.resource_group_name
  description = "value of the resource group where the AKS cluster is deployed."
}

output "kubernetes_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks-cluster.id
  description = "Specifies the resource id of the AKS cluster."
}

output "private_fqdn" {
  value       = azurerm_kubernetes_cluster.aks-cluster.private_fqdn
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
}

output "node_resource_group" {
  value       = azurerm_kubernetes_cluster.aks-cluster.node_resource_group
  description = "Specifies the resource id of the auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}

output "kube_admin_config" {
  value = azurerm_kubernetes_cluster.aks-cluster.kube_admin_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.aks-cluster.kube_config[0].host
}
