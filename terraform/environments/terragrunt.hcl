
locals {
  env = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment    = local.env.locals.environment
  azure_location = local.env.locals.azure_location
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "local" {}
}
EOF
}

generate "provider_azure" {
  path      = "provider_azure.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  version = "=3.116.0"
  features {}
}
EOF
}

inputs = {
  environment    = local.environment
  azure_location = local.azure_location
}