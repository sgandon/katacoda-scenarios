In this step you will add a chart registry to your Helm installation.

## Task

Let's look first at what registries are available from our Helm client:

`helm repo list`{{execute}}

The list should be empty.

Now let's add a repository to our Helm client. Copy the following command and paste it into the terminal:

`helm repo add talend https://sgandon.github.io/katacoda-scenarios/`{{execute}}

Execute again `helm repo list`{{execute}} and see the new `talend` registry in the list.

You can now list the charts from your `talend` registry:

`helm search repo talend`{{execute}}

If you want to find out what else `helm repo` can do, execute the following command:

`helm repo --help`{{execute}}

Now that you have added `talend` registry to your Helm client let's fetch the chart `hello-world` from this registry.
This chart packages the same application you have worked with in the Kubernetes workshop.
Before you download the chart, let's look at some details of this chart (version, app version, description):

`helm search repo talend/hello-world`{{execute}}

Use the following command to fetch the `hello-world` chart and in the same time unpack it in the current folder:

`helm fetch --untar talend/hello-world`{{execute}}

The command above has created a `hello-world` folder inside the current folder.
