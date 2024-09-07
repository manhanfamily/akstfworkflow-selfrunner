module "aks_rg" {
  source              = "../../../../modules/resource_group"
  resource_group_name = var.resource_group_name
}

/*
module "akscluster" {
  source                  = "../../../../modules/aks"
  aks_cluster_name        = var.aks_cluster_name
  resource_group_location = var.resource_group_location       #create rg so not needed?
  resource_group_name     = module.aks_rg.resource_group_name #Chained dependency here
  k8s_version             = var.k8s_version
  dns_prefix              = var.dns_prefix
  node_resourcegroup_name = var.node_resourcegroup_name
  default_node_pool_name  = var.default_node_pool_name
  default_node_pool_size  = var.default_node_pool_size
  zones                   = var.zones
  node_count              = var.node_count
  min_count               = var.min_count
  max_count               = var.max_count
  subnet_id               = data.azurerm_subnet.subnet.id
  tmp_name_system         = var.tmp_name_system
  network_plugin_name     = var.network_plugin_name
  network_policy_name     = var.network_policy_name
  admin_group_object_ids  = [var.admin_group_object_id] # data.azuread_service_principal.service_principal.object_id #TODO: change out to MSI?
  pod_cidr                = var.pod_cidr
  service_cidr            = var.service_cidr
  dns_service_ip          = var.dns_service_ip
  subscription_name       = data.azurerm_subscription.current.display_name
}

module "nodepool" {
  source                = "../../../../modules/nodepool"
  nodepool_name         = var.nodepool_name
  kubernetes_cluster_id = module.akscluster.kubernetes_cluster_id
  nodepool_vm_size      = var.nodepool_vm_size
  subnet_id             = data.azurerm_subnet.subnet.id
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  zones                 = var.zones
  priority              = var.priority
  eviction_policy       = var.eviction_policy
  spot_max_price        = var.spot_max_price
}
*/
