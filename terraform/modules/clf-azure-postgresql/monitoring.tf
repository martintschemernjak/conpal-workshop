resource "azurerm_monitor_activity_log_alert" "main" {
  name                = "mala-postgresql-health"
  resource_group_name = var.resource_group.name

  scopes = [
    azurerm_postgresql_flexible_server.main.id
  ]
  criteria {
    resource_id    = azurerm_postgresql_flexible_server.main.id
    operation_name = "Microsoft.Resourcehealth/healthevent/Activated/action"
    category       = "ResourceHealth"
  }

  action {
    action_group_id = var.monitor_action_group.id
  }
}
