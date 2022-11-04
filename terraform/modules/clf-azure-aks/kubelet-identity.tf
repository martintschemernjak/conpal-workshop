
resource "azurerm_user_assigned_identity" "kubletIdentity" {
  name                = "${var.project_name}-aks-kublet-identity"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.container_registry.id
  principal_id         = azurerm_user_assigned_identity.kubletIdentity.principal_id
  role_definition_name = "AcrPull"
}
