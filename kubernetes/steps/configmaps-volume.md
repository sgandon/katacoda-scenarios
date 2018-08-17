Configmaps can also be mounter a volumes and therefore define configuration files.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">
Let us try to define a config map with a *application.properties* content and mount it in container filesystem.

1. Please have a look at the configmap manifest content here<br/>
`clear; cat file-configmap.yaml`{{execute}}<br/>

2. Then try to mount the configmap as a volume in the web pod <br/>
<details><summary>solution</summary>
<p>
edit *pod.yaml*
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

3. Then deploy those manifests into the cluster.<br/>
`kubectl create -f file-configmap.yaml`{{execute}}<br/>
`kubectl delete pod hello-world`{{execute}}<br/>
`kubectl create -f pod.yaml`{{execute}}

You can now check that the properties file has been properly mounted by using a `kubectl exec` command

Before moving to the next step, please delete the pod (you can keep the service running)


