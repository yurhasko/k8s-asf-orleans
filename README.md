# K8s Orleans demo project

1) Deploy Azure infra via Terragrunt 

```bash
terragrunt run-all apply
```

Note that the terraform state is stored locally for simplicity, since we won't need it after the demo. In a real scenario, we would store it in a remote backend.

2) Fetch kubeconfig

```bash
az aks get-credentials --resource-group az-acr-rg --name webproject-dev-aks
```

3) Export env vars for system setup

```
TRAEFIK_DASHBOARD_HOSTNAME
TRAEFIK_DASHBOARD_NAME
TRAEFIK_DASHBOARD_NAMESPACE
TRAEFIK_DASHBOARD_SVC_NAME
AUTHSECRET_USERNAME
AUTHSECRET_PASSWORD
CLOUDFLARE_TOKEN
REGISTRY_URL
REGISTRY_REPO
IMAGE_TAG
TRAEFIK_USER
TRAEFIK_PWD
```