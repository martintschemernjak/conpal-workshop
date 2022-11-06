resource "azurerm_application_insights" "portal" {
  name                = "appi-portal-fe-cmp-${var.stage_name}-${var.location}-001"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = module.clf-azure-platform.resource_group.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
