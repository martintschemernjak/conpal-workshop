resource "azurerm_mssql_database" "wolfgang_db" {

  name        = "ws-wolfgang"
  server_id   = azurerm_mssql_server.main.id
  collation   = var.database_default_collation
  max_size_gb = var.database_default_size
  sku_name    = var.database_sku_name
}



resource "random_string" "mssql_user_database_username_wolfgang" {
  length  = 16
  special = false
  number  = false
  upper   = false
}

resource "random_password" "mssql_user_database_password_wolfgang" {
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

resource "azurerm_key_vault_secret" "database_username_spring_backend_wolfgang" {
  name         = "db-username-ws-spring-backend-wolfgang"
  value        = random_string.mssql_user_database_username_wolfgang.result
  key_vault_id = var.key_vault.id
}

resource "azurerm_key_vault_secret" "database_password_spring_backend_wolfgang" {
  name         = "db-password-ws-spring-backend-wolfgang"
  value        = random_password.mssql_user_database_password_wolfgang.result
  key_vault_id = var.key_vault.id
}



resource "mssql_login" "dblogin_wolfgang" {
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = "${random_string.database_admin_username.result}@${azurerm_mssql_server.main.name}"
      password = random_password.database_admin_password.result
    }
  }
  login_name       = azurerm_key_vault_secret.database_username_spring_backend_wolfgang.value
  password         = azurerm_key_vault_secret.database_password_spring_backend_wolfgang.value
  default_database = "ws-wolfgang"
}

resource "mssql_user" "dbuser_wolfgang" {
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = "${random_string.database_admin_username.result}@${azurerm_mssql_server.main.name}"
      password = random_password.database_admin_password.result
    }
  }
  username   = "user-${azurerm_key_vault_secret.database_username_spring_backend_wolfgang.value}"
  login_name = azurerm_key_vault_secret.database_username_spring_backend_wolfgang.value
  database   = "ws-wolfgang"
  roles      = ["db_owner"]
}




