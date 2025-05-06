## Task

Your App now has an MySQL DB attached to it

1. The K8S resources needed for your webapp need to be placed in a single file.
   1. Copy the resources definitions from the previous exercise
1. Complete, deploy and inspect the K8s resources needed for MySQL
   1. A single Pod will do, with a Headless Service and a PCV backed by Azure Disk
1. Moreover, the Cluster Admins now need you to create the appropriate CiliumNetworkPolicy, because traffic is DENIED by default.
1. Ensure all resouces are created in *your namespace*
1. Ensure all resouces are labeled as *yours*

## Validation

1. Verify the app is working by accesing it from a Browser.

```bash
kubectl get configmaps -n $YOUR_NAMESPACE
kubectl get pvcs -n $YOUR_NAMESPACE
kubectl get pods -n $YOUR_NAMESPACE
kubectl get services -n $YOUR_NAMESPACE
```
