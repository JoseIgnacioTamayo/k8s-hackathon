## HOW TO
 
 1. Create your own copy of a file with environments variables (`../.envs`)

    ```
    SP_NAME=...
    SUBS_ID=...
    RG_NAME=...
    
    APP_ID=...
    PASSWORD=...
    TENANT_ID=...

    AKS_CLUSTER_NAME=...
    ACR_NAME=...
    ```

 1. Authenticate yourself to Azure with `az login [--use-device-code]`

 1. Create ServicePrincipal for RBAC

    https://learn.microsoft.com/en-us/cli/azure/azure-cli-sp-tutorial-1?tabs=bash#create-a-service-principal-with-role-and-scope

    ```bash
    eval $(cat ../.envs)
    if (az ad sp list --query "[?displayName == '${SP_NAME?}']" --all --out table ); then
        az ad sp create-for-rbac --name  ${SP_NAME?} --query password
    else
        az ad sp create-for-rbac \
      --name ${SP_NAME?}
    fi
    ```

    Update the obtained values into `../.envs`

 1. Prepare your variables file (likely `terraform.tfvars`)

    ```hcl
    subscription_id =
    resources_group_name =

    aks_cluster_name =
    aks_node_count =
    aks_node_vmtype =
    aks_dns_prefix =

    acr_name = 

    service_principal_name =
    ```

 1. Deploy the infrastructure

    ```bash
    terraform apply
    terraform output
    ```

 1. Update the obtained values into `../.envs`

 1. Install an nginx IngressController and a StorageClass

    ```bash
    eval $(cat ../.envs)
    which kubectl || sudo az aks install-cli
    az aks get-credentials --resource-group ${RG_NAME?} --name ${AKS_CLUSTER_NAME?} --subscription ${SUBS_ID?}
    
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.2/deploy/static/provider/cloud/deploy.yaml
    kubectl get services ingress-nginx-controller -n ingress-nginx

    kubectl create -f storage_class.yaml
    ```

 1. Update the Public IP of the Ingress in `../.envs`

 1. Use the ServicePrincipal credentials and test them to access the cluster

    https://learn.microsoft.com/en-us/azure/aks/kubelogin-authentication

    ```bash
    az logout
    eval $(cat ../.envs)
    az login --service-principal --username ${APP_ID?} --tenant ${TENANT_ID?}
    az aks get-credentials --resource-group ${RG_NAME?} --name ${AKS_CLUSTER_NAME?} --subscription ${SUBS_ID?}
    ```
