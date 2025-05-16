## Task

The idea is to expose your WebApp to the Internet.

1. Complete, deploy and inspect an StatefulSet of an example app, with >1 Pod and a PVC
   1. Cmd args `–key=` and `–cert=` to TLS from Secret
   1. Liveness and Readiness (shorter) probes on /health
   1. Request and limit for few resources
   1. Make the container run securely
   1. Mount `/tmp`, `/opt/tls` and `/data`

1. Ensure all resouces are created in *your namespace*
1. Ensure all resouces are labeled as *yours*
1. Complete, deploy and inspect a Service and an Ingress for the example app
   1. Route path /<username> to your service
   1. Set TLS redirection

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
