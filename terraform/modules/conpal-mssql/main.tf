terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.18.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
    mssql = {
      source  = "betr-io/mssql"
      version = "0.2.5"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "mssql" {
  debug = "false"
}
