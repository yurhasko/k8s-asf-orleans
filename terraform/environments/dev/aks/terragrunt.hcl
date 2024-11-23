include {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  environment      = include.locals.environment
  azure_location   = include.locals.azure_location
  workspace_root   = get_repo_root()
}

terraform {
  source = "../../..//modules/aks"
}

inputs = {
  create_resource_group       = false
  az_aks_rg_name              = "az-acr-rg"
  location                    = local.azure_location
  az_aks_cluster_name         = "webproject-${local.environment}-aks"
  az_aks_dns_prefix           = "wp-${local.environment}"
  aks_default_agent_pool_name = "defaultpool"
  az_aks_node_count           = 1
  az_aks_node_vm_size         = "Standard_M8-2ms"
  rbac_enabled                = true
}