This will show you how to deploy a kubernetes manifest to create a single pod with and image from the docker hub that span a simple hello-world web application

## Task

first you need to make sure you cluster is running so please run

`kubectl cluster-info`{{execute}}


Then you can query the K8s api to find out the nodes running in the cluster

`kubectl get nodes`{{execute}}

The you can look at what is a node, you can see the details of the virtual machine used for the nodes : 
* The number of CPUs
* The amount of memory allocated
* the OS running 
* the resources requested explicytly by the PODs 


`kubectl describe node node01`{{execute}}