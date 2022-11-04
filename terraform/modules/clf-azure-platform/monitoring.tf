
resource "azurerm_monitor_action_group" "main" {
  name                = "ag-${var.project_name}-${var.location}-001"
  short_name          = "ag-${substr(var.project_name, 0, 9)}"
  resource_group_name = azurerm_resource_group.project.name

  dynamic "email_receiver" {
    for_each = concat([var.project_admin_email], var.monitoring_alert_receivers_email)
    content {
      name          = email_receiver.value
      email_address = email_receiver.value
    }
  }

  dynamic "azure_app_push_receiver" {
    for_each = var.monitoring_alert_receivers_app_push
    content {
      name          = azure_app_push_receiver.value
      email_address = azure_app_push_receiver.value
    }
  }
}
