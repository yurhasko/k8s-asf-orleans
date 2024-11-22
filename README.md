# K8s Orleans demo project

1) Deploy Azure infra via Terragrunt 

```bash
terragrunt run-all apply
```

Note that the terraform state is stored locally for simplicity, since we won't need it after the demo. In a real scenario, we would store it in a remote backend.

2) 