variable "nodepool_name" {
  description = "node pool name"
  type        = string
}
variable "kubernetes_cluster_id" {
  type = string
}
variable "nodepool_vm_size" {
  description = "node pool size"
  type        = string
}
variable "subnet_id" {
  type = string
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
variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. temporary_name_for_rotation must be specified when changing this property."
  type        = list(string)
}
#Optional spot settings
variable "priority" {
  description = "The priority of the Virtual Machine Scale Set. Possible values are Regular and Spot."
  default     = null
  type        = string
}
variable "eviction_policy" {
  description = "The eviction policy of the Virtual Machine Scale Set. Possible values are Deallocate and Delete."
  default     = null
  type        = string
}
variable "spot_max_price" {
  description = "(Optional) The maximum price you are willing to pay for Spot VMs."
  default     = null
  type        = number
}
