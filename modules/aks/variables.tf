variable "aks_cluster_name" {
  description = "AKS Cluster name"
  type        = string
}
variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}
variable "resource_group_name" {
  description = "resource group name"
  type        = string
}
variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
}
variable "dns_prefix" {
  description = "dns prefix name"
  type        = string
}
variable "node_resourcegroup_name" {
  description = "node resource group name"
  type        = string
}
variable "default_node_pool_name" {
  description = "default node pool name"
  type        = string
}
variable "default_node_pool_size" {
  description = "system node pool size"
  type        = string
}
variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. temporary_name_for_rotation must be specified when changing this property."
  type        = list(string)
}
variable "node_count" {
  description = "(Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count."
  type        = number
}
variable "min_count" {
  description = " (Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
}
variable "max_count" {
  description = "(Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000"
  type        = number
}
variable "subnet_id" {
  type = string
}
variable "tmp_name_system" {
  description = "temperory name for rotation"
  type        = string
}

variable "network_plugin_name" {
  description = "network plugin name"
  type        = string
}
variable "network_policy_name" {
  description = "network policy name"
  type        = string
}
variable "admin_group_object_ids" {
  type = list(string)
}

variable "pod_cidr" {
  description = "value of pod cidr"
  default     = null
  type        = string
}
variable "service_cidr" {
  description = "value of service cidr"
  default     = "10.245.0.0/16"
  type        = string
}
variable "dns_service_ip" {
  description = "value of dns service ip"
  default     = null
  type        = string
}

# variable "tenant_id" {
#   description = "tenant id"
#   type        = string
#   sensitive   = true
# }

variable "subscription_name" {
  type = string
}
