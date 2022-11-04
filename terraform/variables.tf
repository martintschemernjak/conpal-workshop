variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "stage_name" {
  type        = string
  description = "Name of the stage like dev,test or prod"
}

variable "location" {
  type        = string
  description = "Resources location"
  default     = "westeurope"
}

variable "project_name" {
  type        = string
  description = "Project name (will be used for all the module-project names"
}


variable "postgresql_sku_name" {
  type        = string
  description = "SKU of the Postgresql FlexServer"
  default     = "B_Standard_B1ms"
}

variable "postgresql_backup_retention_days" {
  type        = number
  description = "The backup retention days for the PostgreSQL Flexible Server"
  default     = 7
}

variable "postgresql_storage_mb" {
  type        = number
  description = "Initial size of the database"
  default     = 32768
}

variable "postgresql_public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Enables if the database has public access or not"
}

variable "project_admin_email" {
  type        = string
  description = "Email address of the project admin"
}


variable "aks_agent_size" {
  type        = string
  description = "Standard Size of Aks agent"
  default     = "Standard_D2s_v3"
}

variable "aks_nodes" {
  type        = number
  description = "fixed amount of nodes for the aks"
  default     = 3
}
