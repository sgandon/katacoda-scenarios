ConfigMaps are a way of storing key-values pairs inside the k8s cluster. They can be used to provide environment variables or configuration files to containers, let's see how.

The `hello-world` Docker image uses an environment variable called *NAME* which by default is set to `World`. Changing the value of this variable will change the message displayed by the application. In this step you will learn how to create a ConfigMap and how to map it into the `hello-world` Pod to overwrite the default value of the *NAME* environment variable.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">
Here is an exercise for you to perform. Create a ConfigMap manifest file named *configmap.yaml* that will have a single key named *NAME* with the value *Talend*.

1. *Note: You may use `nano` or `vi` to create and edit the file and for additional help with ConfigMaps you can refer to the [k8s documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap)*

<details><summary>solution</summary>
<p>

The content of the file  *configmap.yaml* should look like this:
<br/>

```apiVersion: v1
kind: ConfigMap
metadata:
  name: hello-world-config
data:
  NAME: "Talend"
```

</p>
</details>


2. Please update now the `hello-world` Pod manifest in order to use the ConfigMap as an environment variable.

<details><summary>solution</summary>
<p>

Edit *pod.yaml* and add the *envFrom* element to it. The content of the file should look like this:
<br/>

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

3. Let's deploy now the changed manifests into the k8s cluster:<br/>
`kubectl create -f configmap.yaml`{{execute}}<br/>
`kubectl delete pod hello-world`{{execute}}<br/>
`kubectl create -f pod.yaml`{{execute}}

You can verify the changes by running again the following `curl` command and checking the message displayed by the application:

`kubectl run  curl --restart=Never --image=appropriate/curl --attach=true --rm  http://hello-world`{{execute}}
