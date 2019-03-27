In this step you will learn how to check the status and the configuration of your k8s cluster.

## Task

First you need to make sure that your cluster is running, so please run:

`kubectl cluster-info`{{execute}}

Then you can query the K8s API to find out the nodes running in the cluster:

`kubectl get nodes`{{execute}}

Then you can look at what is a node, you can see the details of the virtual machine used for the nodes: 

* The number of CPUs
* The amount of memory allocated
* The OS running 
* The resources requested explicitly by the PODs 

`kubectl describe node node01`{{execute}}


## Configuration
Clone the following repository with the next command

`git clone https://github.com/sgandon/katacoda-scenarios.git; mv katacoda-scenarios/kubernetes/assets/ talend; rm -rf katacoda-scenarios`{{execute}}


Since we have two terminals, let's setup the second terminal to always display the current states of several k8s objects (e.g. Pods and Services) running in the k8s cluster. 
Let's setup the node01 to have the right kubernetes config (please answer yes to the question):

`rsync /root/.kube/config node01:~/.kube/`{{execute}}

and then display the resources

`watch kubectl get po,svc,cm,deploy`{{execute T2}}

Then copy/paste the command in the bottom terminal and execute it.

