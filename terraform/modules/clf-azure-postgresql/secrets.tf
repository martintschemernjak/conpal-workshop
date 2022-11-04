resource "random_string" "database_username" {
  length  = 16
  special = false
  number  = false
  upper   = false
}

resource "random_password" "database_password" {
  length  = 32
  special = true
}

resource "azurerm_key_vault_secret" "database_username" {
  name         = "PostgresqlUsername"
  value        = "${random_string.database_username.result}@${azurerm_postgresql_flexible_server.main.name}"
  key_vault_id = var.key_vault.id
}

resource "azurerm_key_vault_secret" "database_password" {
  name         = "PostgresqlPassword"
  value        = random_password.database_password.result
  key_vault_id = var.key_vault.id
}
