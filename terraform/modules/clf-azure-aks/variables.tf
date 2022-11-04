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
  description = "The name of an existing resource group."
}

variable "key_vault" {
  type = object({
    id = string
  })
  description = "The existing key vault."
}

variable application_insights {
  type = object({
    id                  = string
    connection_string   = string
    instrumentation_key = string
  })
  description = "The application insights resource"
}

variable action_group {
  type = object({
    id = string
  })
  description = "The action group for alerts"
}

variable cluster_dns_prefix {
  type        = string
  description = "Azure Kubernetes Service cluster dns prefix (defaults to '<project_name>-k8s')"
  default     = null
}


variable http_application_routing {
  type        = bool
  description = "Http application routing enabled"
  default     = false
}

variable enable_auto_scaling {
  type        = bool
  description = "Enable AutoScaling for Nodes"
  default     = false
}


variable k8s_version {
  type        = string
  description = "Azure Kubernetes Service k8s version"
  default     = "1.22.11"
}

# public ip settings
variable pub_ip_domain_name_label {
  type        = string
  description = "Domain name label for the public ip of the aks cluster"
  default     = null
}
variable pub_ip_sku {
  type        = string
  description = "SKU for the public ip of the aks cluster"
  default     = "Standard"
}

# Nodepool settings

variable nodepool_name {
  type        = string
  description = "Azure Kubernetes Service nodepool name"
  default     = "defaut"
}

variable node_count {
  type        = number
  description = "The amount of nodes if auto-scale is set to false"
  default     = "2"
}

variable node_count_min {
  type        = number
  description = "The minimum amount of running nodes in the node-pool"
  default     = "2"
}
variable node_count_max {
  type        = number
  description = "The maximum amount of running nodes in the node-pool"
  default     = "3"
}
variable vm_size {
  type        = string
  description = "Azure Kubernetes Service VM size"
  default     = "Standard_D4_v3"
}
variable vm_os_disk_size {
  type        = number
  description = "Azure Kubernetes Service nodepool OS disk size (in GB)"
  default     = "50"
}
variable vm_os_disk_type {
  type        = string
  description = "Azure Kubernetes Service nodepool OS disk type."
  default     = "Managed"
}

# module dependencies
variable log_analytics_workspace {
  type = object({
    id = string
  })
  description = "The log analytics workspace. Usually a azurerm_log_analytics_workspace object"
}
variable container_registry {
  type = object({
    id = string
  })
  description = "Container registry reference. Usually a azurerm_container_registry object"
}
variable subnet {
  type = object({
    id = string
  })
  description = "The sub net to run the AKS in. Usually a azurerm_subnet object"
}

# Search queries
variable search_queries_image_names {
  type        = list(string)
  description = "Image names of containers for which predefined search queries will be created."
  default     = []
}

# Availability test
variable monitoring_availability_urls {
  type        = map(string)
  description = "URLs that will be monitored and if not available, specified persons will be notified.. The key is an identifier and the value the URL. "
  default     = {}
}