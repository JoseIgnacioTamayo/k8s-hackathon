resource "azurerm_container_registry" "this" {
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  name                = var.acr_name

  sku = "Basic"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "acr_aks" {
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.this.id
}

resource "azurerm_role_assignment" "acr_service_principal" {
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  role_definition_name = "AcrPush"
  scope                = azurerm_container_registry.this.id
}

resource "azurerm_role_assignment" "acr_leaders" {
  for_each = toset(var.aks_cluster_admins)

  principal_id         = data.azuread_user.admins[each.value].object_id
  role_definition_name = "Contributor"
  scope                = azurerm_container_registry.this.id
}

output "acr" {
  value = {
    login_server = azurerm_container_registry.this.login_server
  }
}