output "secret_name_database_username" {
  value       = azurerm_key_vault_secret.database_username.name
  description = "The secret name of the admin database user in the key vault. Contains username postfixed with '@<servername>' to as needed by most clients."
}

output "secret_name_database_password" {
  value       = azurerm_key_vault_secret.database_password.name
  description = "The secret name of the database password in the key vault."
}

output "database_server_name" {
  value       = "${azurerm_postgresql_flexible_server.main.name}.postgres.database.azure.com"
  description = "The fully qualified database server name."
}
