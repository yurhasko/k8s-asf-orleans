variable "create_resource_group" {
  description = "Create a new resource group or not."
  type        = bool
  default     = true
}

variable "az_aks_rg_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "location" {
  description = "The location of the resource group in which to create the AKS cluster."
  type        = string
}

variable "az_aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "az_aks_dns_prefix" {
  description = "The DNS prefix to use with the AKS cluster."
  type        = string
}

variable "aks_default_agent_pool_name" {
  description = "The name of the default agent pool of AKS cluster."
  type        = string
  default     = "defaultpool"
}

variable "az_aks_node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 1
}

variable "az_aks_node_vm_size" {
  description = "The size of the Virtual Machine."
  type        = string
  default     = "Standard_E4_v3"
}

variable "associate_with_acr" {
  description = "A boolean flag to decide whether to associate AKS with ACR"
  type        = bool
  default     = false
}

variable "rbac_enabled" {
  description = "A boolean flag to decide whether to enable RBAC in AKS cluster"
  type        = bool
  default     = true
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry to associate with AKS cluster. Should be passed from ACR module output."
  type        = string
}