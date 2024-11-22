variable "create_resource_group" {
  description = "Create a new resource group or not."
  type        = bool
  default     = true
}

variable "az_acr_rg_name" {
  description = "The name of the resource group in which to create the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "The location of the resource group in which to create the Azure Container Registry."
  type        = string
}

variable "acr_registry_name" {
  description = "The name of the Azure Container Registry."
  type        = string

  validation {
    condition = can(regex("^[a-z0-9]*$", var.acr_registry_name))
    error_message = "The Azure Container Registry name must be a lowercase alphanumeric string."
  }
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
  default     = "Premium"
}

variable "admin_enabled" {
  description = "The admin user enabled or not."
  type        = bool
  default     = true
}

variable "acr_public_network_access" {
  description = "The public network access enabled or not."
  type        = bool
  default     = true
}