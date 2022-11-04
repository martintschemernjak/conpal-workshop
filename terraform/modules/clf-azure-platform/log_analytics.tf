resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-${var.project_name}-${var.location}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.project.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention
}
