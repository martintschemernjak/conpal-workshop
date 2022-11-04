resource "azurerm_kubernetes_cluster" "main" {
  name                = "aks-${var.project_name}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_prefix          = var.cluster_dns_prefix != null ? var.cluster_dns_prefix : "${var.project_name}-k8s"
  kubernetes_version  = var.k8s_version


  http_application_routing_enabled = var.http_application_routing

  default_node_pool {
    name                = var.nodepool_name
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.enable_auto_scaling ? var.node_count_min : null
    max_count           = var.enable_auto_scaling ? var.node_count_max : null
    vm_size             = var.vm_size
    os_disk_size_gb     = var.vm_os_disk_size
    os_disk_type        = var.vm_os_disk_type
    node_count          = var.enable_auto_scaling ? null : var.node_count
    vnet_subnet_id      = var.subnet.id
  }

  identity {
    type                      = "UserAssigned"
    identity_ids  = [azurerm_user_assigned_identity.aks.id]
  }

  kubelet_identity {
    user_assigned_identity_id = azurerm_user_assigned_identity.kubletIdentity.id
    client_id                 = azurerm_user_assigned_identity.kubletIdentity.client_id
    object_id                 = azurerm_user_assigned_identity.kubletIdentity.principal_id
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = false

  }

  oms_agent {
      log_analytics_workspace_id = var.log_analytics_workspace.id
  }

  depends_on = [
    azurerm_role_assignment.kubelet_identity_assign
  ]
}
