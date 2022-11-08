terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"
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
}

provider "mssql" {
  debug = "false"
}
