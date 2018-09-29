In this step you will learn how to check for chart dependencies and how to update chart dependencies.

## Task

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Let's fetch the chart `talend-infrastructure` from the `talend` registry and untar it. Try to do this on your own before you check the solution below. *But don't feel discouraged if you can't. :-)*

<details><summary>Solution</summary>
<p>
`helm fetch --untar talend/talend-infrastructure`{{execute}}
<br/>
</p>
</details>

For the purpose of learning about dependencies let's rename the folder `talend-infrastructure/charts` to `talend-infrastructure/subcharts`:

`mv talend-infrastructure/charts talend-infrastructure/subcharts`{{execute}}

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">To check if the chart can be installed, simulate an install and display the output in the terminal. Use `infra` as Helm Release name.

<details><summary>Solution</summary>
<p>
`helm install talend-infrastructure --name infra --debug --dry-run`{{execute}}
<br/>
</p>
</details>

Right, the chart is missing dependencies! You can list the chart's dependencies with the following command:

`helm dep ls talend-infrastructure`{{execute}}

Take a look at `talend-infrastructure/requirements.yaml` to see where and how dependencies are defined. All dependencies should have been in the `talend-infrastructure/charts` folder but, of course, they don't exist because we deleted that folder.

Let's recreate the `talend-infrastructure/charts` folder by updating the chart's dependencies:

`helm dep up talend-infrastructure`{{execute}}

And now look again at the `talend-infrastructure/charts` folder.

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">You can now proceed to install the chart `talend-infrastructure` with the release name `infra` in k8s. Do you remember the command for installing a chart?

<details><summary>Solution</summary>
<p>
`helm install talend-infrastructure --name infra`{{execute}}
<br/>
</p>
</details>

Unfortunately that install has failed because, by default, the infrastructure chart doesn't create any objects. 
You will have to explicitly set which infrastructure service you want to create. 
This can be done through tags and/or conditions which we are going to tackle down in the next step. 

However, even if the installed has failed, Helm has created a release which we need to delete. 

<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMTguMzYzIDguNDY0bDEuNDMzIDEuNDMxLTEyLjY3IDEyLjY2OS03LjEyNSAxLjQzNiAxLjQzOS03LjEyNyAxMi42NjUtMTIuNjY4IDEuNDMxIDEuNDMxLTEyLjI1NSAxMi4yMjQtLjcyNiAzLjU4NCAzLjU4NC0uNzIzIDEyLjIyNC0xMi4yNTd6bS0uMDU2LTguNDY0bC0yLjgxNSAyLjgxNyA1LjY5MSA1LjY5MiAyLjgxNy0yLjgyMS01LjY5My01LjY4OHptLTEyLjMxOCAxOC43MThsMTEuMzEzLTExLjMxNi0uNzA1LS43MDctMTEuMzEzIDExLjMxNC43MDUuNzA5eiIvPjwvc3ZnPg==">Try to list existig releases and delete the `infra` one.

<details><summary>Solution</summary>
<p>
`helm ls`{{execute}}
<br/>
`helm delete --purge infra`{{execute}}
<br/>
</p>
</details>