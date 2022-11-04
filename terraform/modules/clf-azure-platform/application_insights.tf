resource "azurerm_application_insights" "main" {
  name                = "appi-${var.project_name}-${var.location}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.project.name
  workspace_id        = azurerm_log_analytics_workspace.main.id
  application_type    = "web"
}
