This step will show you how to use a k8s manifest file to deploy a Pod which hosts a single container with a hello-world application. For this you will use a docker image from Docker Hub.

## Task

You first need to jump into the folder used for this workshop:

`cd talend/kubernetes/hello-world`{{execute}}

Display the Pod manifest just to see how it looks like:

`clear; cat pod.yaml`{{execute}}

Deploy the Pod into Kubernetes and watch the second terminal to see how the Pod is created. Please pay attention to how the Pod's STATUS value changes until the Pod is up and running:

`kubectl create -f pod.yaml`{{execute}}

Get the Pod status and description:

`kubectl describe pod hello-world`{{execute}}

Get the logs of the container. In this case you only have one container therefore it is not necessary to specify the container name:

`kubectl logs hello-world`{{execute}}

We must insist that this is a very handy command for developers,
let's try to see the logs of the etc instance in the kubernetes cluster

`kubectl logs -n kube-system etcd-master`{{execute}}

Attach to the `hello-world` container and run `sh` (very similar to a docker exec):

`kubectl exec -it hello-world sh`{{execute}}<br/>
`ls`{{execute}}<br/>
`ps`{{execute}}

You can see the the sh process and the sleep processes running.

Exit from the container with the `exit` command and then kill the Pod:

`kubectl delete pod hello-world`{{execute}}
