## Task

1. Use the ServicePrincipal credentials to login to Azure

1. Get fresh credentials to the AKS Cluster

1. Create a Namespace with *your* name

1. Manually run a container in your namespace, using image `${ACR_NAME?}.azurecr.io/${ACR_NAME?}.webapp:${VERSION?}`

## Validation

```bash
kubectl cluster-info

kubectl get pods -n ${YOUR_NAMESPACE}
```

## Helps

https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-service-principal?view=azure-cli-latest
https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-get-credentials