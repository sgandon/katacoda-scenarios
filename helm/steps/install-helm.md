In this step you will install Helm Server on the cluster and you will execute your first helm commands. Please note that Helm Client is already installed.

## Task

If you check Helm's version you will see that Helm Server, also called Tiller, could not be found.

`helm version`{{execute}}

Use the following command to install Helm Server:

`helm init --service-account tiller`{{execute}}

This might take a few seconds. Tiller is installed as a pod in the k8s cluster. The pod names starts with `tiller-deploy-`. You can see when Tiller is available by monitoring the pods in all namespaces. Please pay attention to the column `Ready` which should display `1/1`.

`kubectl get pods --all-namespaces -w`{{execute}}

Once the Tiller pod is running, kill the previous command (CTRL-C) and check again Helm's version: 

`helm version`{{execute}}

Now that Tiller is up and running let's move to the next step