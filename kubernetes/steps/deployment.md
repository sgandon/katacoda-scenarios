K8s Deployments represent deployed applications. They can contain one or more Pods and they rely on ReplicaSets to scale up/down an application. One of the main tasks of a k8s Deployment is to provide rolling upgrades and rollbacks. 

While you can use Pods and ReplicaSets to deploy applications in a k8s cluster, it is recommended and also much easier to use Deployments.

Let's look at the deployment manifest file for our Hello World application:

`clear; cat deployment.yaml`{{execute}}

Then you can simply deploy it:

`kubectl apply -f deployment.yaml`{{execute}}

In order to ckeck the web server we are going to create a new Service called `exposed-service` for the `hello-world` Deployment. This Service will serve requests on port 80 and will connect to the containers also on port 80.

`kubectl expose deployment hello-world --name=exposed-service --external-ip="[[HOST_IP]]" --port=80 --target-port=80`{{execute}}

You can try the Service at the following URL:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

If you look at the Pods that are deployed you'll see that the Pod name contains a suffix that was set by the ReplicaSet. The reason behind this is that Pod names must be unique and when scaling up, the name given to the Pod is not sufficient anymore. 

Now that we have a Deployment configured we can try to scale up or down the Pods. Let's try to scale up the `hello-world` Deployment to 3 Pods:

`kubectl scale --replicas=3 deployment/hello-world`{{execute}}

You can also scale up/down the Pods by changing the number of replicas inside the *deployment.yaml* file.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Try to scale down the Pods by changing the number of replicas inside the *deployment.yaml* file to 2 Pods, then apply the changes to the k8s cluster.

<details><summary>Solution</summary>
<p>
Edit *deployment.yaml* and set the field `replicas` to 2.

```
replicas: 2
```

Then execute:

`kubectl apply -f deployment.yaml`{{execute}}
</p>
</details>

You can also edit them live using the `kubectl edit` command. This will open vi to edit the k8s resource and upon close it will apply the changes to the k8s cluster. Try to do this on your own before you check the solution below.

<details><summary>Solution</summary>
<p>
`kubectl edit deployment hello-world`{{execute}}

```
  <esc> + <i> : to insert
  <esc> + <:> + <q> : to quit without saving
  <esc> + <:> + <x> : to quit and save
```
</p>
</details>

You can also try to delete a Pod and see what happens.

