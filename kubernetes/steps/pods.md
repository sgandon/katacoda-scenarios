This will show you how to deploy a kubernetes manifest to create a single pod with and image from the docker hub that span a simple hello-world web application

## Task

You need to jump into the folder used for this workshop:

`cd talend/kubernetes/hello-world`{{execute}}

Display the pods manifest just to see how it looks:

`clear; cat pod.yaml`{{execute}}

Deploy the pod into kubernetes and watch the second terminal to see how the pod is comming up:

`kubectl create -f pod.yaml`{{execute}}

Get the pod status and description:

`kubectl describe pods hello-cretes`{{execute}}

Get the logs of the container:

`kubectl logs hello-cretes`{{execute}}

Attach to the `hello-cretes` container and run `sh` (very similar to a docker exec):

`kubectl exec -it hello-cretes sh`{{execute}}

Exit from the container with the `exit` command and then kill the pod:

`kubectl delete pod hello-cretes`{{execute}}

