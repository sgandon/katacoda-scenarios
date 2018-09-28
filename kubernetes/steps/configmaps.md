ConfigMaps are a way of storing key-values pairs.
They can be used to provide environment variables or configuration files to pods, let's see how.

The Hello-word image supports an environment variable called *NAME*.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">
So here is an exercise for you to perform

Create a ConfigMap manifest file named *configmap.yaml* that will have a single key named *NAME* with the value *Cretes*.

You may use *nano* or *vi* to create and edit the file and refer to the [kubernetes documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap)

<details><summary>solution</summary>
<p>
create *configmap.yaml*
<br/>

```apiVersion: v1
kind: ConfigMap
metadata:
  name: hello-world-config
data:
  NAME: "Cretes"
```

</p>
</details>


Once the ConfigMap manifest is created, please update the pod manifest in order to use the ConfigMap as an environment variable.

<details><summary>solution</summary>
<p>

Edit *pod.yaml* and add the *envFrom* element

```apiVersion: v1
kind: Pod
metadata:
  name: hello-world
  labels:
    app: hello-world-app
spec:
  containers:
  - name: hello-world-container
    image: tutum/hello-world
    envFrom:
      - configMapRef:
          name: hello-world-config
...     
```

</p>
</details>

Then deploy those manifests into the cluster

- `kubectl create -f configmap.yaml`{{execute}}
- `kubectl delete pod hello-world`{{execute}}
- `kubectl create -f pod.yaml`{{execute}}

You can check by running the previous curl command

`kubectl run  curl --restart=Never --image=appropriate/curl --attach=true --rm  http://hello-world`{{execute}}

