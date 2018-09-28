In this step you will learn how to check for chart dependencies and how to update chart dependencies.

## Task

Let's fetch the chart `talend-infrastructure` from the `talend` registry and untar it. Try to do this on your own before you check the solution below:

<details><summary>Solution</summary>
<p>
`helm fetch --untar talend/talend-infrastructure`{{execute}}
<br/>
</p>
</details>

For the purpose of learning about dependencies let's delete the folder `talend-infrastructure/charts`:

`rm -r talend-infrastructure/chart`{{execute}}

To check if the chart can be installed, simulate an install and display the output in the terminal. Use `infra` as Helm Release name.
See if you can do this on your own before you check the solution below. *But don't feel discouraged if you can't. :-)*

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

You can now proceed to install the chart `talend-infrastructure` with the release name `infra` in k8s. Do you remember the command for installing a chart?

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
Try to list existig releases and delete the `infra` one.

<details><summary>Solution</summary>
<p>
`helm ls`{{execute}}
<br/>
`helm delete --purge infra`{{execute}}
<br/>
</p>
</details>