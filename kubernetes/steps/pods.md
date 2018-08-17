This will show you how to deploy a kubernetes manifest to create a single pod with and image from the docker hub that span a simple hello-world web application

## Task

You need to jump into the folder used for this workshop

`cd talend/kubernetes/hello-world`{{execute}}

display the pods manifest just to see how it looks

`clear; cat pod.yaml`{{execute}}

deploy the pod into kubernetes

`kubectl create -f pod.yaml
`{{execute}}

watch the pod comming up

`kubectl get pods -w`{{execute}}

get the pod status and description

`kubectl describe pods hello-cretes`{{execute}}

get the logs of the container

`kubectl logs hello-cretes`{{execute}}


run a command in the container very similar to a docker exec

`kubectl exec -it hello-cretes sh`{{execute}}

kill the pod

`kubectl delete pod hello-cretes`{{execute}}

