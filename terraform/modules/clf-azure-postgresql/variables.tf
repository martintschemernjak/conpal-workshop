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

variable monitor_action_group {
  type = object({
    id = string
  })
  description = "The action group for alerts"
}

variable "key_vault" {
  type = object({
    id = string
  })
  description = "The existing key vault."
}

variable "server_sku" {
  type        = string
  description = "SKU for postgresql Server"
  default     = "GP_Gen5_2"
}

variable "database_default_charset" {
  type        = string
  description = "Database charset for postgresql"
  default     = "UTF8"
}


variable "database_default_collation" {
  type        = string
  description = "Database collation for postgresql"
  default     = "en_US.utf8"
}

variable "databases" {
  type = map(object({
    charset   = optional(string)
    collation = optional(string)
  }))
  description = "Databases to create."
  default     = {}
}

variable "backup_retention_days" {
  type        = number
  description = "The backup retention days for the PostgreSQL Flexible Server"
  default     = 7
}

variable "storage_mb" {
  type        = number
  description = "Initial size of the database"
  default     = 5120
}

variable "private_endpoints" {
  type = map(object({
    virtual_network = any
    subnet          = any
  }))
  default     = {}
  description = "A private endpoint that connects the DB to a virtual_network and subnet. (Only available if server_sku is NOT Basic)"
}

variable "auto_grow_enabled" {
  type        = bool
  default     = true
  description = "Enables the databases to grow beyound the given initial size (storage_mb)."
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
  description = "Enables geo-redundant backups."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Allows external clients to access the db-server"
}

variable "ssl_enforcement_enabled" {
  type        = bool
  default     = true
  description = "Enforce SSL connections"
}

variable "firewall_rules" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default     = {}
  description = "Map of firewall rules for the database"
}

variable "subnet" {
  type = object({
    id = string
  })
  description = "Subnet for PostgresqlDB"
}
