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

resource "azurerm_mssql_database" "main" {
  count = length(var.databases)

  name        = var.databases[count.index].name
  server_id   = azurerm_mssql_server.main.id
  collation   = var.databases[count.index].collation != null ? var.databases[count.index].collation : var.database_default_collation
  max_size_gb = var.databases[count.index].max_size_gb != null ? var.databases[count.index].max_size_gb : var.database_default_size
  sku_name    = var.databases[count.index].sku_name != null ? var.databases[count.index].sku_name : var.database_sku_name
}
