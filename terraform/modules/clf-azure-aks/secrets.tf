data "azurerm_kubernetes_cluster" "credentials" {
  name                = azurerm_kubernetes_cluster.main.name
  resource_group_name = var.resource_group.name
}

resource "azurerm_key_vault_secret" "aks_client_credentials" {
  name         = "AksClientCredentials"
  value        = jsonencode({
    host = data.azurerm_kubernetes_cluster.credentials.kube_config.0.host
    client_certificate = data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_certificate
    client_key = data.azurerm_kubernetes_cluster.credentials.kube_config.0.client_key
    cluster_ca_certificate = data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate
  }) 
  key_vault_id = var.key_vault.id
}
