resource "azurerm_application_insights" "appi_armin" {
  name                = "appi-ws-spring-backend-armin"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}


resource "azurerm_application_insights" "appi_kilian" {
  name                = "appi-ws-spring-backend-kilian"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}

resource "azurerm_application_insights" "appi_stefan" {
  name                = "appi-ws-spring-backend-stefan"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}

resource "azurerm_application_insights" "appi_thomas" {
  name                = "appi-ws-spring-backend-thomas"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}

resource "azurerm_application_insights" "appi_ulrich" {
  name                = "appi-ws-spring-backend-ulrich"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}

resource "azurerm_application_insights" "appi_wolfgang" {
  name                = "appi-ws-spring-backend-wolfgang"
  location            = var.location
  resource_group_name = module.clf-azure-platform.resource_group.name
  workspace_id        = module.clf-azure-platform.log_analytics_workspace.id
  application_type    = "web"
}
