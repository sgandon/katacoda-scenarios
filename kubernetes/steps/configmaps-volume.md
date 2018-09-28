ConfigMaps can also be mounted as volumes and therefore define configuration files.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">
Let's try to define a config map with an *`application.properties`* content and mount it in the container'filesystem.

Please have a look at the ConfigMap manifest content here
`clear; cat file-configmap.yaml`{{execute}}<br/>

Then try to mount the ConfigMap as a volume in the web pod <br/>

<details><summary>solution</summary>
<p>

Edit *pod.yaml*
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

Then deploy those manifests into the cluster.<br/>

- `kubectl create -f file-configmap.yaml`{{execute}}
- `kubectl delete pod hello-world`{{execute}}
- `kubectl create -f pod.yaml`{{execute}}

You can now check that the properties file has been properly mounted by using a `kubectl exec` command

Before moving to the next step, please delete the pod (you can keep the service running)


