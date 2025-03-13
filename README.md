# K8S Hackathon Lab

This is an educational-purposed K8S Lab

## Organization

 * /plattform: Here is the Code that deploys the needed Cloud resources and IDs for Guides and Hackers to use (K8S Cluster, Registry, etc)
 * /excercises
   * /app: Here is a small web app that will be packaged as a Container
   * /deploy: Here are K8S manifests to deploy the containeraized app in the K8S cluster

## Playscript

1. Leaders set the road
    Leaders create all the needed Cloud resources and IDs found in `/plattform`
1. Hackers get their Credentials to use while hacking
2. Hackers complete the WebApp in `/exercises/app`, package it and push it to a Registry
3. Hackers complete the K8S manifests in `/exercises/deploy` to deploy the WebApp, and test it.

## Plattform architecture

