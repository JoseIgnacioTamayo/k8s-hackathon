## Task

To make your app easy to deploy, make it a Helm Charm

1. Copy the resources definitions from the previous exercise into `/templates`.
1. Define some variables for your app.
1. Install the Helm Chart in a new namespace, with the appropriate values.

## Validation

```bash
kubectl get pvc -n $YOUR_NAMESPACE
kubectl get pod -n $YOUR_NAMESPACE
kubectl get service -n $YOUR_NAMESPACE
```
