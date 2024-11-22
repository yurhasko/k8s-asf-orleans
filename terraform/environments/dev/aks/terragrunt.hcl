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

dependency "acr" {
  config_path = "../acr"
}

inputs = {
  create_resource_group       = false
  az_aks_rg_name              = dependency.acr.outputs.resource_group_name
  location                    = local.azure_location
  az_aks_cluster_name         = "webproject-${local.environment}-aks"
  az_aks_dns_prefix           = "wp-${local.environment}"
  aks_default_agent_pool_name = "defaultpool"
  az_aks_node_count           = 2
  az_aks_node_vm_size         = "Standard_B2pls_v2"
  associate_with_acr          = true
  acr_id                      = dependency.acr.outputs.acr_id
  rbac_enabled                = true
}