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

`kubectl exec -it hello-world sh`{{execute}}<br/>
`cd /etc/config`{{execute}}<br/>
`ls -l`{{execute}}<br/>
`cat application.properties`{{execute}}<br/>
</p>
</details>

<svg id="Layer_3" xmlns="http://www.w3.org/2000/svg" xml:space="preserve" height="32" width="32" version="1.0" viewBox="0 0 627.769 550.45">
<path id="path2231" fill="#ea0000" d="m614.57 504.94l-279.4-483.94c-4.38-7.588-12.47-12.262-21.23-12.262s-16.85 4.674-21.23 12.258l-279.41 483.94c-4.375 7.58-4.375 16.93 0.003 24.52 4.379 7.58 12.472 12.25 21.23 12.25h558.81c8.76 0 16.86-4.67 21.23-12.25 4.38-7.59 4.38-16.94 0-24.52z"/>
<polygon id="polygon2233" points="93.977 482.88 533.9 482.88 313.94 101.89" fill="#fff"/>
<path id="path2235" d="m291.87 343.36c1.21 11.49 3.21 20.04 6.02 25.66 2.81 5.63 7.82 8.43 15.04 8.43h2.01c7.22 0 12.24-2.8 15.04-8.43 2.81-5.62 4.82-14.17 6.02-25.66l6.42-88.75c1.21-17.3 1.81-29.71 1.81-37.25 0-10.25-2.91-18.25-8.73-23.99-5.53-5.46-13.38-8.59-21.56-8.59s-16.04 3.13-21.57 8.59c-5.81 5.74-8.72 13.74-8.72 23.99 0 7.54 0.6 19.95 1.8 37.25l6.42 88.75z"/>
<circle id="circle2237" cy="430.79" cx="313.94" r="30.747"/>
</svg>
Before moving to the next step, please delete the `hello-world` Pod (you can keep the Service running).


