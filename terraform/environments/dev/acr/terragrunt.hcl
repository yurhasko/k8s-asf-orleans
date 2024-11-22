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
  source = "../../..//modules/acr"
}

inputs = {
  create_resource_group     = true
  az_acr_rg_name            = "az-acr-rg"
  location                  = local.azure_location
  acr_registry_name         = "${replace("webproject${local.environment}", "-", "")}"
  acr_sku                   = "Premium"
  admin_enabled             = true
  acr_public_network_access = true
}