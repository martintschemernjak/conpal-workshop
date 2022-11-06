
resource "mssql_login" "dblogin" {
  count = length(var.databases)
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = random_string.database_admin_username.result
      password = random_password.database_admin_password.result
    }
  }
  login_name       = azurerm_key_vault_secret.database_username[count.index].value
  password         = azurerm_key_vault_secret.database_password[count.index].value
  default_database = var.databases[count.index].name
}

resource "mssql_user" "dbuser" {
  count = length(var.databases)
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = random_string.database_admin_username.result
      password = random_password.database_admin_password.result
    }
  }
  username   = "user-${azurerm_key_vault_secret.database_username[count.index].value}"
  login_name = mssql_login.dblogin[count.index].login_name
  database   = var.databases[count.index].name
  roles      = ["db_owner"]
}
