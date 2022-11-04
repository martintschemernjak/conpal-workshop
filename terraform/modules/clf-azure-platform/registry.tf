resource "azurerm_container_registry" "main" {
  name                = replace("cr${var.project_name}${var.location}001", "-", "")
  resource_group_name = azurerm_resource_group.shared.name
  location            = var.location
  sku                 = var.registry_sku
  # TODO - disable this and only allow access using Service Principal
  admin_enabled       = true
}
