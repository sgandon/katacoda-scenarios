To learn about k8s Services you first need to launch a pod that runs a container providing some sort of API to the external world.
For the exercises we will use a simple hello-world web application that listens on a given port for any http requests.

`cd webapp`{{execute}}

Please have a look at the pod definition:

`clear; cat pod.yaml`{{execute}}

Notice that we added a *port* definition with the name `http` and also 2 probes for k8s to check on the *readiness* and *liveness* of the container.

So let's deploy it:

`kubectl create -f pod.yaml`{{execute}}

Now let's create a k8s Service to get access to this pod:

`clear; cat service.yaml`{{execute}}

`kubectl create -f service.yaml`{{execute}}

Let's check we can call the Service:

`kubectl run  curl --restart=Never --image=appropriate/curl --attach=true --rm  http://hello-world`{{execute}}

Let's have a look at the Service description:

`kubectl describe svc hello-world`{{execute}}

Notice that in the field *`Endpoints`* you will see the *`IP`* addresses of the pods linked to this Service.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">
As a small exercise, please try to find out the *`IP`* of the `hello-world` pod and check that the Service's *`Endpoints`* address corresponds to it.

<details><summary>Solution</summary>
<p>
Run the following command and check the field IP:

`kubectl describe pod hello-world`{{execute}}

Compare it with the value of the Service's Endpoints field.
</p>
</details>