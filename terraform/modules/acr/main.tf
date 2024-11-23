locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.acr-rg.*.name, azurerm_resource_group.acr-rg-tf.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.acr-rg.*.location, azurerm_resource_group.acr-rg-tf.*.location, [""]), 0)
}

data "azurerm_resource_group" "acr-rg" {
  count = var.create_resource_group ? 0 : 1
  name  = var.az_acr_rg_name
}

resource "azurerm_resource_group" "acr-rg-tf" {
  name     = var.az_acr_rg_name
  location = var.location
}

resource "azurerm_container_registry" "az-acr-tf" {
  name                          = var.acr_registry_name
  resource_group_name           = local.resource_group_name
  location                      = local.location
  sku                           = var.acr_sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.acr_public_network_access
}

resource "azurerm_role_assignment" "ds_aks_acr_pull" {
  principal_id                     = var.kubelet_identity
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.az-acr-tf.id
  skip_service_principal_aad_check = true
}