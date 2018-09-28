This will show you how to deploy a Kubernetes manifest to create a single pod with an image from the Docker hub which starts a simple hello-world web application

## Task

You first need to jump into the folder used for this workshop

`cd talend/kubernetes/hello-world`{{execute}}

Display the pod manifest just to see how it looks like

`clear; cat pod.yaml`{{execute}}

Deploy the pod into Kubernetes

`kubectl create -f pod.yaml
`{{execute}}

Watch the pod coming up

`kubectl get pods -w`{{execute}}

Get the pod status and description

`kubectl describe pods hello-cretes`{{execute}}

Get the logs of the running container

`kubectl logs hello-cretes`{{execute}}

Run a command in the container very similarly to a docker exec

`kubectl exec -it hello-cretes sh`{{execute}}

Kill the pod

`kubectl delete pod hello-cretes`{{execute}}

