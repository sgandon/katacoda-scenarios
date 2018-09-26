Deployment are a mean of gathering some resources together such as replicaset and pods. 
They also serve as a base for rolling upgrades. 

We usually do not use pods and replicasets manifests but most of the time create deployments 

let's look at the deployment manifest for

`clear; cat deployment.yaml`{{execute}}

then you can simply deploy it 

`kubectl apply -f deployment.yaml`{{execute}}

In order to ckeck the web server we are going to expose the service

`kubectl expose deployment hello-world --name=exposed-service --external-ip="[[HOST_IP]]" --port=80 --target-port=80`{{execute}}

you can then try the service at

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/


If you look at the pods that are deployed you'll see that the pod name contains a suffix that was set by the replicaset.
Pod name must be unique and when scaling up.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Now that we have a replicaset set configured we can try to scale up or down the pods

1. Use `kubectl scale` to scale up to 3 pods

<details><summary>solution</summary>
<br/>
`kubectl scale --replicas=3 deployment/hello-world`{{execute}}
</p>
</details>

2. You can also edit to have 2 replicas and apply the *deployment.yaml*

<details><summary>solution</summary>
<br/>
edit *deployment.yaml* and set 

```
replicas: 2
```
then execute <br/>
`kubectl apply -f deployment.yaml`{{execute}}
</p>
</details>

3. You can also edit them live using the `kubectl edit` command, it will open vi to edit the resource and apply it upon close of the editor
<details><summary>solution</summary>
<br/>
`kubectl edit deployment hello-world`{{execute}}

```
  <esc> + <i> : to insert
  <esc> + <:> + <q> : to quit without saving
  <esc> + <:> + <x> : to quit and save
```
</p>

</details>



4. You can also try to delete a pod and see what happens