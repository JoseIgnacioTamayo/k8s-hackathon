variable "subscription_id" {
  type = string
}

variable "resources_group_name" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "aks_node_count" {
  type = string
}

variable "aks_node_vmtype" {
  type = string
}

variable "aks_dns_prefix" {
  type = string
}

variable "service_principal_name" {
  type = string
}

variable "aks_cluster_admins" {
  type        = list(string)
  default     = []
  description = "List of Azure Users that are Admins of the Cluster"
}

variable "acr_name" {
  type = string
}