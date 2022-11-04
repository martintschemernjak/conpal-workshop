# This file contains everything necessary to execute the example-1/main.tf but is not visible in the documentation

provider "azurerm" {
  features {}
}

variable "subscription_id" {
  type    = string
  default = "15c6e514-0cbc-4c6d-b386-8a3e01037a06"
}

variable "project_name" {
  type    = string
  default = "sample"
}

variable "project_admin_email" {
  type    = string
  default = "sample_project@invalid.cloudflight.io"
}
