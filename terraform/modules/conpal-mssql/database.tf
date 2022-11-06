resource "azurerm_mssql_server" "main" {
  name                         = "sql-${var.project_name}-001"
  resource_group_name          = var.resource_group.name
  location                     = var.resource_group.location
  version                      = "12.0"
  administrator_login          = random_string.database_admin_username.result
  administrator_login_password = random_password.database_admin_password.result
  minimum_tls_version          = "1.2"

  public_network_access_enabled = var.public_network_access_enabled
}

