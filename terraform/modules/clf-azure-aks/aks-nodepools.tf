# resource "azurerm_kubernetes_cluster_node_pool" "additionalnodepool" {
#   name                  = "default2core"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
#   vm_size               = "Standard_D2s_v3"
#   node_count            = 2
# }
