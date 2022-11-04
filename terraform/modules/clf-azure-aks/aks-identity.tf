# aks identity and add role to be able to assign kublet identity
resource "azurerm_user_assigned_identity" "aks" {
  name                = "aks-identity-${var.project_name}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}

resource "random_uuid" "kublet_identity_assign" {}
resource "azurerm_role_definition" "kubelet_identity_assign" {
  role_definition_id = random_uuid.kublet_identity_assign.result
  name               = "${var.project_name}-custom-kublet-identity-permission"
  scope              = var.resource_group.id

  permissions {
    actions = [
      "Microsoft.ManagedIdentity/userAssignedIdentities/assign/action",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/loadBalancers/write"
    ]
    not_actions = []
  }

  assignable_scopes = [
    var.resource_group.id
  ]
}

resource "azurerm_role_assignment" "kubelet_identity_assign" {
  scope              = var.resource_group.id
  principal_id       = azurerm_user_assigned_identity.aks.principal_id
  role_definition_id = azurerm_role_definition.kubelet_identity_assign.role_definition_resource_id
}
