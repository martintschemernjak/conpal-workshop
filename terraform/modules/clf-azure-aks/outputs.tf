output aks_identity {
  value       = azurerm_user_assigned_identity.aks
  description = "The aks identity"
}

output aks_node_resource_group_name {
  value       = azurerm_kubernetes_cluster.main.node_resource_group
  description = "The node resource group name"
}

output inbound_ip {
  value       = azurerm_public_ip.inbound_ip
  description = "The inbound public ip that is created for the aks and that can be used by the kubernetes ingress"
}

output outbound_ip {
  value       = data.azurerm_public_ip.outbound_ip
  description = "The outbound public ip of the aks cluster that can be used to whitelist aks services"
}

output "credentials_secret_name" {
  value       = azurerm_key_vault_secret.aks_client_credentials.name
  description = "The secret name of the aks master credentials in the key vault"
}
