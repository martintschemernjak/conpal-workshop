resource "azurerm_postgresql_flexible_server" "main" {
  name                = "psql-${var.project_name}-001"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  administrator_login          = random_string.database_username.result
  administrator_password       = random_password.database_password.result

  sku_name   = var.server_sku
  storage_mb = var.storage_mb
  version    = "12"

  delegated_subnet_id    = var.public_network_access_enabled ? null: var.subnet.id 

  backup_retention_days = var.backup_retention_days

  zone = "1"
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
}

resource "azurerm_postgresql_flexible_server_database" "main" {
  for_each = var.databases

  name                = each.key
  server_id           = azurerm_postgresql_flexible_server.main.id
  charset             = each.value.charset != null ? each.value.charset : var.database_default_charset
  collation           = each.value.collation != null ? each.value.collation : var.database_default_collation
}
