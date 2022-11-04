resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.project_name}-${var.location}-001"
  resource_group_name = azurerm_resource_group.project.name
  location            = var.location
  address_space       = var.virtual_network_address_space
}

resource "azurerm_subnet" "aks" {
  name                                           = "snet-${var.project_name}-aks-${var.location}-001"
  resource_group_name                            = azurerm_resource_group.project.name
  virtual_network_name                           = azurerm_virtual_network.main.name
  address_prefixes                               = var.subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "postgres" {
  name                                           = "snet-${var.project_name}-postgresql-${var.location}-002"
  resource_group_name                            = azurerm_resource_group.project.name
  virtual_network_name                           = azurerm_virtual_network.main.name
  address_prefixes                               = var.subnet_address_prefixes_postgressql
  enforce_private_link_endpoint_network_policies = true
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
