## Task

1. Use the ServicePrincipal credentials and test them to access the cluster

1. Create a Namespace for you

1. Manually run a container in your namespace, using image `${ACR_NAME?}.azurecr.io/${ACR_NAME?}.webapp:${VERSION?}`

## Validation

```bash
kubectl cluster-info

kubectl get pods -n $YOUR_NAMESPACE
```
