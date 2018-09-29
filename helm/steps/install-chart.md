In this step you will install the `hello-world` chart in the k8s cluster.

## Task

Helm provides two commands which are recommended to be used before installing a chart:
* `helm lint` checks the formatting of the manifest files
* `helm --debug --dry-run` simulates an install. The flag "`--debug`" displays the output of the install in the console.

Let's execute these command and check their output:

`helm lint hello-world`{{execute}}

`helm install hello-world --debug --dry-run`{{execute}}

The chart is now ready to be installed. Every time a chart is installed, Helm will assign it a new release name unless you explicitly overwrite it. You can overwrite the default name with the "`--name`" flag. Let's use `kickoff` as our release name:

`helm install hello-world --name kickoff`{{execute}}

List all Helm/k8s applications/releases with the following command:

`helm ls`{{execute}}

Please note the columns REVISION, CHART and APP VERSION.

You can also see the resources deployed by a release with the following command:

`helm status kickoff`{{execute}}

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Check the status of pods to see when the application has been full deployed:

<details><summary>Solution</summary>
<p>
`kubectl get pods -w`
<br/>
</p>
</details>

When the `hello-world` pod is running find out the service port exposed by k8s (the port will be in the range 30000-32767):

`kubectl get --namespace default -o jsonpath='{.spec.ports[0].nodePort}{"\n"}' services kickoff-hello-world`{{execute}}

In the upper side of the terminal (title bar) you have a "`+`" sign. Click on it and choose option "`Select port to view on Host 1`" from the popup menu. This will open a new tab in the browser where you can enter the port displayed by the previous command. After you enter the port click "`Display Port`". The hello-world welcome page will appear which confirms that the application is up and running in the k8s cluster. 

Let's move to the next step and see how we can perform an upgrade and a rollback on the Helm release.
