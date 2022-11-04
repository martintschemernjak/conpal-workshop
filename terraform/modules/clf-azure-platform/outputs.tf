output "resource_group" {
  value       = azurerm_resource_group.project
  description = "The resource group for that platform"
}

output "log_analytics_workspace" {
  value       = azurerm_log_analytics_workspace.main
  description = "The log analytics workspace"
}

output "application_insights" {
  value       = azurerm_application_insights.main
  description = "The application insights"
}

output "monitor_action_group" {
  value       = azurerm_monitor_action_group.main
  description = "The action monitoring group"
}

output "key_vault" {
  value       = azurerm_key_vault.main
  description = "The standard key vault"
}

output "container_registry" {
  value       = azurerm_container_registry.main
  description = "Default container registry"
}

output "virtual_network" {
  value       = azurerm_virtual_network.main
  description = "Default virtual network"
}

output "subnet_postgres" {
  value       = azurerm_subnet.postgres
  description = "Default sub net"
}

output "subnet_aks" {
  value       = azurerm_subnet.aks
  description = "Default sub net"
}
