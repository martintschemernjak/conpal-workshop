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


variable "mssql_public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Enables if the database has public access or not"
}

variable "mssql_portal_sku_name" {
  type        = string
  default     = "Basic"
  description = "Tier of the MSSQL Database"
}
variable "mssql_tenantmgm_sku_name" {
  type        = string
  default     = "Basic"
  description = "Tier of the MSSQL Database"
}
variable "mssql_auditing_sku_name" {
  type        = string
  default     = "Basic"
  description = "Tier of the MSSQL Database"
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
