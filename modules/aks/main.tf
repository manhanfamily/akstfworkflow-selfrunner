locals {
  plugin_mode = var.network_plugin_name == "azure" ? "overlay" : null
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                    = var.aks_cluster_name
  location                = var.resource_group_location
  resource_group_name     = var.resource_group_name
  kubernetes_version      = var.k8s_version
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = true
  node_resource_group     = var.node_resourcegroup_name
  sku_tier                = "Standard"
  cost_analysis_enabled   = true

  default_node_pool {
    name                         = var.default_node_pool_name
    vm_size                      = var.default_node_pool_size
    zones                        = var.zones
    node_count                   = var.node_count
    min_count                    = var.min_count
    max_count                    = var.max_count
    vnet_subnet_id               = var.subnet_id
    only_critical_addons_enabled = true
    temporary_name_for_rotation  = var.tmp_name_system
  }

  #TODO: Check
  identity {
    type = "UserAssigned"
  }

  network_profile {
    network_plugin      = var.network_plugin_name
    network_policy      = var.network_policy_name
    network_plugin_mode = local.plugin_mode
    outbound_type       = "userDefinedRouting"
    pod_cidr            = var.pod_cidr
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
  }

  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
  }

  auto_scaler_profile {
    balance_similar_node_groups = false  
    expander                    = "random"
    scale_down_delay_after_add  = "10m"
  }

  azure_policy_enabled = true

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
      default_node_pool[0].node_count
    ]
  }

  # UTC - Equal to Thursday 0300 GMT+8
  # Run for max 3 hours
  maintenance_window {
    allowed {
      day   = "Wednesday"
      hours = [18, 4]
    }
  }

  timeouts {
    create = "30m"
    read   = "30m"
    update = "30m"
    delete = "30m"
  }
}

# needs to be here as evalled in plan stage
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].host
  username               = azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].username
  password               = azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_admin_config[0].cluster_ca_certificate)
}

resource "kubernetes_cluster_role_binding" "azure-sp-role-binding" {
  depends_on = [azurerm_kubernetes_cluster.aks-cluster]
  metadata {
    name = "azure-sp-role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = var.admin_group_object_ids[0]
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_namespace" "ns_sops" {
  depends_on = [azurerm_kubernetes_cluster.aks-cluster]
  metadata {
    name = "sops"
  }
}
