variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
  validation {
    condition     = can(regex("^[a-z-]*$", var.project_name))
    error_message = "Project name must only contain lower case letters and hyphens."
  }
}

variable location {
  type        = string
  description = "Resources location"
  default     = "westeurope"
}

variable "admins" {
  type    = map(object({
    object_id = string
  }))
  description = "A map of admin-accounts specified using there object-ids."
  default = {}
}

variable "service_principle_display_name" {
  type = string
  description = "A given Azure Service-Principle defined by its display-name."
}
