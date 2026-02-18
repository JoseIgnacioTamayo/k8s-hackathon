## Task

1. Use the ServicePrincipal credentials to login to Azure

1. Get fresh credentials to the AKS Cluster

1. Create a Namespace with *your* name

1. Look for the highest version of the *webapp* container witn `az acr repository show-tags -n ${ACR_NAME?} --repository webapp`

1. Manually run the *webapp* container in your namespace, using image `${ACR_NAME?}.azurecr.io/webapp:${TAG?}`

## Validation

```bash
kubectl cluster-info

kubectl get pods -n ${YOUR_NAMESPACE}
```

## Helps

https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-service-principal?view=azure-cli-latest
https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-get-credentials
https://learn.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest
https://kubernetes.io/docs/reference/kubectl/quick-reference