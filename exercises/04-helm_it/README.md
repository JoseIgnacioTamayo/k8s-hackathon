## Task

To make your app easy to deploy, make it a Helm Charm

1. Copy the resources definitions from the previous exercise into `/templates`.
1. Define some variables for your app.
1. Install the Helm Chart in a new namespace, with the appropriate values.

## Validation

```bash
kubectl get pvcs -n $YOUR_NAMESPACE
kubectl get pods -n $YOUR_NAMESPACE
kubectl get services -n $YOUR_NAMESPACE
```
