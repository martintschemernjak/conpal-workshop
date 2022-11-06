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

resource "random_string" "mssql_user_database_username" {
  count   = length(var.databases)
  length  = 16
  special = false
  number  = false
  upper   = false
}

resource "random_password" "mssql_user_database_password" {
  count            = length(var.databases)
  length           = 16
  special          = true
  lower            = true
  numeric          = true
  upper            = true
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = ".-_!#"
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


resource "azurerm_key_vault_secret" "database_username" {
  count        = length(var.databases)
  name         = "db-username-${var.databases[count.index].name}"
  value        = random_string.mssql_user_database_username[count.index].result
  key_vault_id = var.key_vault.id
}

resource "azurerm_key_vault_secret" "database_password" {
  count        = length(var.databases)
  name         = "db-password-${var.databases[count.index].name}"
  value        = random_password.mssql_user_database_password[count.index].result
  key_vault_id = var.key_vault.id
}
