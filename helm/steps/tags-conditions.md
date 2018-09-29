In this step you will learn about tags and conditions, which are a means to enable and disable chart dependencies.

## Task

The `talend-infrastructure` chart has five dependencies and by default they are all disabled.
Look again at `talend-infrastructure/requirements.yaml` and especially pay attention to the fields `condition` and `tags`.
Then look at `talend-infrastructure/values.yaml` to see the default values for the tags. The condition `global.infra.enabled` is not defined at all.

Default values can be overriden at install time either by specifying a new values file with the `-f` parameter or 
by specifying an new individual value with the `--set` parameter.

Let's enable the `talend-redis` dependency by using the `--set` parameter:

`helm install talend-infrastructure --name infra --set tags.talend-redis=true`{{execute}}

*Alternatively, you can use a new values file as follows:*

*`helm install talend-infrastructure --name infra -f values-standalone.yaml`*

Check the status of the release with `helm ls`. Redis is now up and running inside the k8s cluster.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Do you remember how to check what pods are available in k8s? What about how to attach to a pod and run a command? 
Attach to the redis pod and run the command `redis-cli ping`. You should receive a `pong` message back.

<details><summary>Solution</summary>
<p>
`kubectl get pods`{{execute}}
<br/>
`kubectl exec -it redis-pod redis-cli ping`{{execute}}
<br/>

*Note: Don't forget to replace `redis-pod` with the actual pod name.*
</p>
</details>

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">You can now delete the `infra` release.

<details><summary>Solution</summary>
<p>
`helm delete --purge infra`{{execute}}
<br/>
</p>
</details>