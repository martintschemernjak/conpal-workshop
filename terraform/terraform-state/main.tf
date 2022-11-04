terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.18.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "fa20c111-7584-474b-9419-b69723166ffd"
  tenant_id       = "f70e8e1c-de5c-4b7b-a962-301a87f3f378"
}

module "clf-azure-setup-terraform" {
  source          = "git::git@git.internal.cloudflight.io:cloudflight/libs/cloudflight-terraform.git//modules/clf-azure-setup-terraform"
  subscription_id = "fa20c111-7584-474b-9419-b69723166ffd"
  project_name    = "lancrypt-ws"
}
