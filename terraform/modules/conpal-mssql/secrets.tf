resource "random_string" "database_admin_username" {
  length  = 16
  special = false
  number  = false
  upper   = false
}

resource "random_password" "database_admin_password" {
  length  = 32
  special = true
}


resource "azurerm_key_vault_secret" "database_admin_username" {
  name         = "MSSQLAdminUser"
  value        = "${random_string.database_admin_username.result}@${azurerm_mssql_server.main.name}"
  key_vault_id = var.key_vault.id
}

resource "azurerm_key_vault_secret" "database_admin_password" {
  name         = "MSSQLAdminPassword"
  value        = random_password.database_admin_password.result
  key_vault_id = var.key_vault.id
}

