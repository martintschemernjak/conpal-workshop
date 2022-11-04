data "azurerm_public_ip" "outbound_ip" {
  name                = reverse(split("/", tolist(azurerm_kubernetes_cluster.main.network_profile.0.load_balancer_profile.0.effective_outbound_ips)[0]))[0]
  resource_group_name = azurerm_kubernetes_cluster.main.node_resource_group
}

resource "azurerm_public_ip" "inbound_ip" {
  name                = "pip-${var.project_name}"
  resource_group_name = azurerm_kubernetes_cluster.main.node_resource_group
  location            = var.resource_group.location
  allocation_method   = "Static"
  sku                 = var.pub_ip_sku
}
