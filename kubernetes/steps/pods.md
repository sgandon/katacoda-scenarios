This will show you how to deploy a Kubernetes manifest to create a single pod with an image from the Docker hub which starts a simple hello-world web application

## Task

You first need to jump into the folder used for this workshop:

`cd talend/kubernetes/hello-world`{{execute}}

Display the pod manifest just to see how it looks like:

`clear; cat pod.yaml`{{execute}}

Deploy the pod into Kubernetes and watch the second terminal to see how the pod is coming up:

`kubectl create -f pod.yaml`{{execute}}

Get the pod status and description:

`kubectl describe pods hello-cretes`{{execute}}

Get the logs of the container:

`kubectl logs hello-cretes`{{execute}}

Attach to the `hello-cretes` container and run `sh` (very similar to a docker exec):

`kubectl exec -it hello-cretes sh`{{execute}}

Exit from the container with the `exit` command and then kill the pod:

`kubectl delete pod hello-cretes`{{execute}}

