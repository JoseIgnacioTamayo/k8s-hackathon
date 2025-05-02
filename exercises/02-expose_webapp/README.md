## Task

The idea is to expose your WebApp to the Internet.

1. Complete, deploy and inspect an StatefulSet of an example app, with >1 Pod and a PVC.
1. Complete, deploy and inspect a Service and an Ingress for the example app.

## Validation

1. Verify the app is working by accesing it from a Browser.

```bash
kubectl get configmaps -n $YOUR_NAMESPACE
kubectl get secrets -n $YOUR_NAMESPACE
kubectl get pvcs -n $YOUR_NAMESPACE
kubectl get deployments -n $YOUR_NAMESPACE
kubectl get pods -n $YOUR_NAMESPACE
kubectl get services -n $YOUR_NAMESPACE
kubectl get ingress -n $YOUR_NAMESPACE
```
