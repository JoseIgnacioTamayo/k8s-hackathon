## Task

Your App now has an MySQL DB attached to it

1. The K8S resources needed for your webapp need to be placed in a single file.
   1. Copy the resources definitions from the previous exercise into `webapp.yaml`
1. Complete, deploy and inspect the K8s resources needed for MySQL
   1. A single Pod will do, with a Headless Service and a PCV backed by Azure Disk
   1. The webapp Pods need to know, via EnvVar, the user and password to connect to the MySQL instance.
   1. The webapp needs the command argument to use the MySQL service.
1. Moreover, the Cluster Admins now need you to create the appropriate Network Policy, because traffic is DENIED by default.
1. Ensure all resouces are created in *your namespace*
1. Ensure all resouces are labeled as *yours*

## Validation

1. Verify the app is working by accesing it from a Browser.

```bash
kubectl get configmap -n $YOUR_NAMESPACE
kubectl get pvc -n $YOUR_NAMESPACE
kubectl get pod -n $YOUR_NAMESPACE
kubectl get service -n $YOUR_NAMESPACE
```
