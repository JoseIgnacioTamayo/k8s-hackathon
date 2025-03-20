## HOW TO

1. Authenticate yourself to Azure with `az login`

1. Create ServicePrincipal for RBAC

    https://learn.microsoft.com/en-us/cli/azure/azure-cli-sp-tutorial-1?tabs=bash#create-a-service-principal-with-role-and-scope

   ```bash
   az ad sp create-for-rbac \
      --name <name> \
      --role reader \
      --scopes /subscriptions/<SubscriptionID>/resourceGroups/<RG>
    ```

1. Prepare your variables file (likely `terraform.tfvars`)

   ```hcl
   subscription_id =
   resources_group_name =

   aks_cluster_name =
   aks_node_count =
   aks_node_vmtype =
   aks_dns_prefix =

   service_principal_name =
   ```

1. Deploy the infrastructure

    ```bash
    terraform apply
    terraform output
    ```

1. Use the ServicePrincipal credentials and test them to access the cluster

   https://learn.microsoft.com/en-us/azure/aks/kubelogin-authentication

    ```bash
    az logout
    az login --service-principal --username $APP_ID --password $CLIENT_SECRET --tenant $TENANT_ID
    az aks get-credentials --resource-group $RG_NAME --name $AKS_CLUSTER_NAME --subscription $SUBSCRIPTION
    ```
