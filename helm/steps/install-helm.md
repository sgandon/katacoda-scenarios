In this step you will install Helm Server on the cluster and you will execute your first helm commands. Please note that Helm Client is already installed.

## Task

If you check Helm's version you will see that Helm Server, also called Tiller, could not be found.

`helm version`{{execute}}

In order to intall Helm Server you will need to clone a github repo:

`git clone https://github.com/sgandon/katacoda-scenarios.git`{{execute}}

and then run the following command to create a Service Account inside the k8s cluster:

`kubectl create -f katacoda-scenarios/helm/assets/rbac-config.yaml`{{execute}}

Now you are ready to install Helm Server:

`helm init --service-account tiller`{{execute}}

This might take a few seconds. Tiller is installed as a pod in the k8s cluster. The pod names starts with `tiller-deploy-`. You can see when Tiller is available by monitoring the pods in all namespaces. Please pay attention to the column `Ready` which should display `1/1`.

`kubectl get pods --all-namespaces -w`{{execute}}

Once the Tiller pod is running, kill the previous command (CTRL-C) and check again Helm's version: 

`helm version`{{execute}}

You should have this output:

```bash
Client: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.10.0", GitCommit:"9ad53aac42165a5fadc6c87be0dea6b115f93090", GitTreeState:"clean"}
```

Now that Tiller is up and running let's move to the next step