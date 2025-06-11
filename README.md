# K8S Hackathon Lab

This is an educational-purposed K8S Lab

## Code Organization

 1. `/plattform`: Terraform code that deploys the needed Cloud resources and IDs for Guides and Hackers to use (Cluster, Registry, etc)
 1. `/app`: Small web app that will be packaged as a Container and pushed to the Registry
 1. `/exercises`: The challenges that the Hackers need to work on to get the web app up and working on the AKS Cluster

## Playscript

1. Leaders set the road
    Leaders create all the needed Cloud resources and IDs found in `/plattform`
1. Leaders show how the web app is packaged and pushed to the Registry, from `/app`
1. Hackers get their Credentials to use while hacking
2. Hackers start solving the exercises, sequentially, at `/exercises`

## Plattform architecture

 1. A single AKS Cluster is needed, with an nginx IngressController.
    1. This will create, in Azure, a LoadBalancer with a Public IP. 
       This PublicIP can get assigned a publicly-resolvable DNS entry.
       This becomes the FQDN to use to reach the nginx Ingress
 1. An ACR instance, where to push the webapp image
 1. The needed RBAC entries to allow Guides and Hackers to work and have fun

 ## Remember to cleanup

 After the trainig is complete, remember to destroy all the provisioned Azure resouces. This is as easy as `terraform destroy`.

 ## Disclaimer

This code is provided AS-IS and without any warranty.

The author bears no responsibility for the costs incurred when this code is deployed.
