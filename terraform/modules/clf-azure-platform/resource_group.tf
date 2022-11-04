
resource "azurerm_resource_group" "shared" {
  name     = "rg-shared-${var.stage_name}-${var.location}-001"
  location = "West Europe"
}

resource "azurerm_resource_group" "project" {
  name     = "rg-${var.project_name}-${var.location}-001"
  location = "West Europe"
}

