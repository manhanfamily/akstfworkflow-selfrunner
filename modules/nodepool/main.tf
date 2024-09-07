resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.nodepool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.nodepool_vm_size
  vnet_subnet_id        = var.subnet_id
  auto_scaling_enabled  = true
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  zones                 = var.zones
  #Optional Spot nodepool settings
  priority        = var.priority
  eviction_policy = var.eviction_policy
  spot_max_price  = var.spot_max_price

  node_labels = {
    "UserWorkloads" = "true"
    #Add spot label
  }

  lifecycle {
    prevent_destroy = false #temp for sbx test
    ignore_changes = [
      tags,
      node_count
    ]
  }
}
