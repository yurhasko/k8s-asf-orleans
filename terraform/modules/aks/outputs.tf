/*
 * Outputs the client certificate for the AKS cluster.
 *
 * This output retrieves the client certificate for the AKS cluster and marks it as sensitive.
 */
output "aks_client_certificate" {
  value     = azurerm_kubernetes_cluster.az-aks-cluster.kube_config[0].client_certificate
  sensitive = true
}

/*
 * Outputs the raw kubeconfig for the AKS cluster.
 *
 * This output retrieves the raw kubeconfig for the AKS cluster and marks it as sensitive.
 *
 * Note: please use 'terraform output -raw kube_config' to retrieve the raw kubeconfig from state.
 * Use 'az aks get-credentials' to retrieve the kubeconfig from Azure and append to local kubeconfig.
 */
output "kubeconfig" {
  value     = azurerm_kubernetes_cluster.az-aks-cluster.kube_config_raw
  sensitive = true
}