variable "project_name" {
  type        = string
  description = "The name of the project"
  default     = "sample-project"
  validation {
    condition     = can(regex("^[a-z-]*$", var.project_name))
    error_message = "Project name must only contain lower case letters and hyphens."
  }
}

variable "resource_group" {
  type = object({
    id       = string
    location = string
    name     = string
  })
  description = "The existing resource group."
}


variable "key_vault" {
  type = object({
    id = string
  })
  description = "The existing key vault."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Allows external clients to access the db-server"
}

variable "databases" {
  type = list(object({
    max_size_gb = optional(number)
    collation   = optional(string)
    sku_name    = optional(string)
    name        = string
  }))
  description = "Databases to create."
  default     = []
}

variable "database_default_collation" {
  type        = string
  description = "Database collation for postgresql"
  default     = "LATIN1_GENERAL_100_CI_AS_SC_UTF8"
}

variable "database_sku_name" {
  type        = string
  description = "Default SKU Name of the database"
  default     = "S0"
}

variable "database_default_size" {
  type        = number
  description = "Default size of the database in GB"
  default     = 1
}

variable "firewall_rules" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default     = {}
  description = "Map of firewall rules for the database"
}
