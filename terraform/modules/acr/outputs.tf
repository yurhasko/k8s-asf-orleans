/**
 * Outputs the admin username for the Azure Container Registry.
 *
 * This output retrieves the admin username for the Azure Container Registry and marks it as sensitive.
 */
output "acr_admin_username" {
  value     = var.admin_enabled == true ? azurerm_container_registry.az-acr-tf.admin_username : null
  sensitive = true
}

/**
 * Outputs the admin password for the Azure Container Registry.
 *
 * This output retrieves the admin password for the Azure Container Registry and marks it as sensitive.
 */
output "acr_admin_password" {
  value     = var.admin_enabled == true ? azurerm_container_registry.az-acr-tf.admin_password : null
  sensitive = true
}

/**
 * Outputs the ACR access token.
 *
 * This output retrieves the access token (base64-encoded username:password) for the Azure Container Registry and marks it as sensitive.
 */

output "acr_access_token" {
  value     = var.admin_enabled == true ? base64encode("${azurerm_container_registry.az-acr-tf.admin_username}:${azurerm_container_registry.az-acr-tf.admin_password}") : null
  sensitive = true
}


/**
 * Outputs the login server for the Azure Container Registry.
 *
 * This output retrieves the login server for the Azure Container Registry.
 */
output "acr_endpoint" {
  value = azurerm_container_registry.az-acr-tf.login_server
}

/**
 * Outputs the id for the Azure Container Registry.
 *
 * This output retrieves the id for the Azure Container Registry.
 */
output "acr_id" {
  value = azurerm_container_registry.az-acr-tf.id
}

/**
 * Outputs the resource group name.
 *
 * This output retrieves the resource group name for the Azure Container Registry.
 */

output "resource_group_name" {
  value = local.resource_group_name
}