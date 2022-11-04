terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }
  backend "azurerm" {
    container_name = "tfstate"
    key            = "terraform.tfstate"
    # use_azuread_auth = true
    tenant_id            = "f70e8e1c-de5c-4b7b-a962-301a87f3f378"
    resource_group_name  = "lancrypt-ws-tfstate"
    storage_account_name = "lancryptwstfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
