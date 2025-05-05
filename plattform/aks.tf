
data "azurerm_resource_group" "this" {
  name = var.resources_group_name
}

resource "azurerm_kubernetes_cluster" "this" {
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  name                = var.aks_cluster_name

  identity {
    type = "SystemAssigned"
  }

  dns_prefix = var.aks_dns_prefix

  default_node_pool {
    name       = "defaultpool"
    vm_size    = var.aks_node_vmtype
    node_count = var.aks_node_count
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  network_profile {
    network_plugin      = "azure"
    network_policy      = "cilium"
    network_data_plane  = "cilium"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "basic"
  }
}

data "azuread_service_principal" "hacker" {
  display_name = var.service_principal_name
}

data "azuread_user" "admins" {
  for_each = toset(var.aks_cluster_admins)

  user_principal_name = each.value
}

resource "azurerm_role_assignment" "hacker" {
  scope                = azurerm_kubernetes_cluster.this.id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = data.azuread_service_principal.hacker.object_id
}

resource "azurerm_role_assignment" "aks_cluster_admins" {
  for_each = toset(var.aks_cluster_admins)

  scope                = azurerm_kubernetes_cluster.this.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = data.azuread_user.admins[each.value].object_id
}

resource "azurerm_role_assignment" "aks_leaders" {
  for_each = toset(var.aks_cluster_admins)

  scope                = azurerm_kubernetes_cluster.this.id
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = data.azuread_user.admins[each.value].object_id
}

output "aks_cluster" {
  value = {
    name    = azurerm_kubernetes_cluster.this.name
    lb_fqdn = "${var.aks_dns_prefix}.switzerlandnorth.cloudapp.azure.com"
  }
}