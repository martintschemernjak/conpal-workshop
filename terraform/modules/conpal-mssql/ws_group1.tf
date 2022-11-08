resource "azurerm_mssql_database" "group1" {

  name        = "ws-group1"
  server_id   = azurerm_mssql_server.main.id
  collation   = var.database_default_collation
  max_size_gb = var.database_default_size
  sku_name    = var.database_sku_name
}


resource "random_string" "mssql_user_database_username_group1" {
  length  = 16
  special = false
  number  = false
  upper   = false
}

resource "random_password" "mssql_user_database_password_group1" {
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


resource "mssql_login" "dblogin" {
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = random_string.database_admin_username.result
      password = random_password.database_admin_password.result
    }
  }
  login_name       = azurerm_key_vault_secret.database_username_spring_backend_group1.value
  password         = azurerm_key_vault_secret.database_password_spring_backend_group1.value
  default_database = "ws-group1"
}

resource "mssql_user" "dbuser" {
  server {
    host = "${azurerm_mssql_server.main.name}.database.windows.net"
    login {
      username = random_string.database_admin_username.result
      password = random_password.database_admin_password.result
    }
  }
  username   = "user-${azurerm_key_vault_secret.database_username_spring_backend_group1.value}"
  login_name = azurerm_key_vault_secret.database_username_spring_backend_group1.value
  database   = "ws-group1"
  roles      = ["db_owner"]
}



resource "azurerm_key_vault_secret" "database_username_spring_backend_group1" {
  name         = "db-username-ws-spring-backend-group1"
  value        = random_string.mssql_user_database_username_group1.result
  key_vault_id = var.key_vault.id
}

resource "azurerm_key_vault_secret" "database_password_spring_backend_group1" {
  name         = "db-password-ws-spring-backend-group1"
  value        = random_password.mssql_user_database_password_group1.result
  key_vault_id = var.key_vault.id
}

