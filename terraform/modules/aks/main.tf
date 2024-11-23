/*
 * Locals to determine the resource group name and location for the Azure Kubernetes cluster.
 *
 * Locals values are determined by the following logic, which is based on the condition - is the rg already created or not.
 */

locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.aks-rg.*.name, azurerm_resource_group.aks-rg-tf.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.aks-rg.*.location, azurerm_resource_group.aks-rg-tf.*.location, [""]), 0)
}

/*
 * Create an Azure resource group for the Azure Kubernetes cluster.
 *
 * The Azure Kubernetes cluster resource group is created based on the following logic:
 * - If the resource group is already created, then the Azure Kubernetes cluster is created in the existing resource group.
 * - If the resource group is not created, then the Azure Kubernetes cluster is created in a new resource group.
 */
data "azurerm_resource_group" "aks-rg" {
  count = var.create_resource_group ? 0 : 1
  name  = var.az_aks_rg_name
}

resource "azurerm_resource_group" "aks-rg-tf" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.az_aks_rg_name)
  location = var.location
}

/*
 * Creates an Azure Kubernetes Service (AKS) cluster.
 *
 * This resource creates an Azure Kubernetes Service (AKS) cluster with the specified name, resource group, and location. Optional settings include node count, node size, and whether to associate the cluster with an Azure Container Registry.
 */
resource "azurerm_kubernetes_cluster" "az-aks-cluster" {
  name                = var.az_aks_cluster_name
  location            = local.location
  resource_group_name = local.resource_group_name
  dns_prefix          = var.az_aks_dns_prefix

  default_node_pool {
    name                        = var.aks_default_agent_pool_name
    enable_auto_scaling = true
    max_count = 2
    min_count = 1
    vm_size                     = var.az_aks_node_vm_size
    temporary_name_for_rotation = "temppool"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = var.rbac_enabled
}