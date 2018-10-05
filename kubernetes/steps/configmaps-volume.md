In the previous step you learned how to provide environment variables to containers. In this step you will learn how to provide configuration files to containers by mounting a ConfigMap as a volume inside the container. 

Please have a look at the content of the ConfigMap manifest file `file-configmap.yaml`:

`clear; cat file-configmap.yaml`{{execute}}<br/>

As you can see, it contains a key called `application.properties` followed by a multi-line string value. Mounting this ConfigMap inside a Pod will generate an `application.properties` file inside the container.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Your task now is to mount the `file-config` ConfigMap defined in the `file-configmap.yaml` manifest file as a volume inside the `hello-world` Pod. 

<details><summary>Solution</summary>
<p>

Edit *pod.yaml* and add the *volumeMounts* and *volumes* elements to it. The content of the file should look like this:
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
...
    volumeMounts:
      - name: config-volume
        mountPath: /etc/config
  volumes:
    - name: config-volume
      configMap:
        name: file-config        
```

</p>
</details>

Then delete the `hello-world` Pod and deploy the `file-configmap.yaml` and `pod.yaml` manifest files into the k8s cluster.<br/>

- `kubectl delete pod hello-world`{{execute}}

- `kubectl create -f file-configmap.yaml`{{execute}}
- `kubectl create -f pod.yaml`{{execute}}

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Do you remember how to attach to a running Pod/container? Please verify that the `application.properties` file has been successfuly created inside the `hello-world` Pod.

<details><summary>Solution</summary>
<p>

`kubectl exec -it hello-world sh`{{execute}}

`cd /etc/config`{{execute}}

`ls -l`{{execute}}
</p>
</details>

Before moving to the next step, please delete the `hello-world` Pod (you can keep the Service running).


