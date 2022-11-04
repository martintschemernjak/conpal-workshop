variable project_name {
  type        = string
  description = "The name of the project"
  default     = "sample-project"
  validation {
    condition     = length(var.project_name) <= 14 && can(regex("^[a-z-]*$", var.project_name))
    error_message = "Project name must only contain lower case letters and hyphens and have 14 chars at max."
  }
}

variable location {
  type        = string
  description = "Resources location"
  default     = "westeurope"
}

variable resource_group_name {
  type        = string
  description = "Name of the resource group for the platform"
  default     = null
}

variable "tf_service_principal_ids" {
  type        = set(string)
  description = "Principal ids of all executing terraform accounts"
  default = []
}

variable project_admin_email {
  type        = string
  description = "E-mail of the project admin. This will be the default person to get budet and alert e-mails."
}

variable subscription_id {
  type        = string
  description = "The id of the subscription."
}

variable budget_amount {
  type        = number
  description = "The monthly budget amount in EUR"
  default     = 200
}

variable budget_email_notification_recipients {
  type        = list(string)
  description = "E-mail addresses of recipients who should get budget notification e-mails."
  default     = []
}

variable log_analytics_retention {
  type        = number
  description = "Retention time in days for all stored log information"
  default     = 30
}

variable monitoring_alert_receivers_email {
  type        = list(string)
  description = "List of e-mail addresses of user that will receive alerts via e-mail."
  default     = []
}

variable monitoring_alert_receivers_app_push {
  type        = list(tuple([string, string]))
  description = "List of e-mail addresses of user that will receive alerts via push notifications."
  default     = []
}

variable registry_sku {
  type        = string
  description = "SKU of the container registry. Can be 'Basic', 'Standard' and 'Premium'"
  default     = "Basic"
}

variable registry_name {
  type        = string
  description = "Name of the container registry. Must be globally unique. If set to null, it will be computed from the project name"
  default     = null
}

variable virtual_network_address_space {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space."
  default     = ["192.168.0.0/16"]
}

variable subnet_address_prefixes {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
  default     = ["192.168.1.0/24"]
}

variable subnet_address_prefixes_postgressql {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
  default     = ["192.168.2.0/24"]
}


variable stage_name {
  type        = string
  description = "Name of the stage like dev,test or prod"
}
