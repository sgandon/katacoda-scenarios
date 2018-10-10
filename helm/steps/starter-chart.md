In this step you will learn about Talend's starter-chart.

## Task

The helm create command allows to create a chart based on a so called “starter chart”. 
Starter charts are regular charts which function as templates for new charts. The starter charts must be located in `$HELM_HOME/starters` and they have to be manually copied there. Talend has created a starter chart which you will download and untar from the `talend` repository. The chart name is `starter-chart`. 

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Try to download and untar the chart in the current folder before you check the solution below.

<details><summary>Solution</summary>
<p>
`kubectl get pods`{{execute}}
<br/>
`helm fetch --untar talend/starter-chart`{{execute}}
<br/>
</p>
</details>

Move the `starter-chart` folder to your `$HELM_HOME/starters` (.helm/starters).

`mv starter-chart .helm/starters`{{execute}}

Create now a new chart called `hello-greece` using the create command with the `--starter` flag:

`helm create hello-greece --starter starter-chart`{{execute}}

You should now have a new folder `hello-greece` in your root folder. 

There are several fields you need to update in the file `hello-greece/values.yaml` before you can install the chart into the k8s cluster:

1. Uncomment the field `image.registry` and update its value to `"-"`.
1. Update the value of the field `image.path` to `tutum/hello-world`.
1. Update the value of the field `image.port` to `80`.
1. Update the value of the field `service.type` to `NodePort`.

You are now ready to install the chart.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Install the chart `hello-greece` and name the realease `kickoff18`.

<details><summary>Solution</summary>
<p>
`helm install hello-greece --name kickoff18`{{execute}}
<br/>
</p>
</details>

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Check the status of the release.

<details><summary>Solution</summary>
<p>
`helm ls`{{execute}}
<br/>
`helm status kickoff18`{{execute}}
<br/>
</p>
</details>

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Check the status of pods to see when the application has been full deployed:

<details><summary>Solution</summary>
<p>
`kubectl get pods -w`{{execute}}
<br/>
</p>
</details>

When the `hello-greece` pod is running find out the service port exposed by k8s (the port will be in the range 30000-32767):

`kubectl get --namespace default -o jsonpath='{.spec.ports[0].nodePort}{"\n"}' services kickoff18-hello-greece`{{execute}}

In the upper side of the terminal (title bar) you have a tab called "`Display 8080`". Click on it and a new tab will open in your browser. The URL will have the following format: `https://177078276-8080-599693266-training1.environments.katacoda.com/` but the application will not work. Replace `8080` in the host name with the port displayed by the previous command. The hello-world welcome page will appear which confirms that the application is up and running in the k8s cluster. 

Feel free to scale up and down the application either through the `kubectl` or `helm` commands which you have learned!

Congratulations, you have finished your Helm workshop!