This will show you how to deploy a kubernetes manifest to create a single pod with and image from the docker hub that span a simple hello-world web application

## Task

First you need to make sure you cluster is running so please run

`kubectl cluster-info`{{execute}}

Then you can query the K8s API to find out the nodes running in the cluster

`kubectl get nodes`{{execute}}

Then you can look at what is a node, you can see the details of the virtual machine used for the nodes : 

* The number of CPUs
* The amount of memory allocated
* The OS running 
* The resources requested explicitly by the PODs 

`kubectl describe node node01`{{execute}}

Let's setup the second terminal to display the current states of pods and services

`ifconfig ens3 | grep "inet addr"`{{execute}}

Grab the IP address and replace it in the following command on the bottom terminal

`mkdir .kube; scp <ip adress>:/root/.kube/config /root/.kube/config; watch kubectl get po,svc,cm,deploy`

