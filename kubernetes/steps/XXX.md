This will show you how to initialise helm

## Task

we assume helm client is installed on the machine, which is the case in this example.

you can check the version

`helm version`{{execute}}

You will notice an Error message saying the tiller could not be found.
The Tiller is the Helm server that must be installed on the cluster.

Now we will install the helm server called the Tiller 

`helm init`{{execute}}

We shall wait for a the pod to be started, you can execute this to see the status `kubectl get pods --all-namespaces -w`{{execute}}

once the Tiller pods is running kill the previous command and you can launch again the `helm version` {{execute}} again and see the server version too


setup the talend helm repo
`helm repo add talend https://talendregistry.jfrog.io/talendregistry/tlnd-helm-kickoff-2018 --username kickoff-user-ro --password <thepassword>`{{execute}}

check all avaialable package
`helm search`

install one helm package
`helm install talend/talend-infrastructure`
does not install anything by default

install zookeeper and kafka
`helm install talend/talend-infrastructure --set tags.talend-zookeeper=true --set tags.talend-kafka=true`

test the kafka is working

first launch a kafka client
`kubectl kafka-client --image=wurstmeister/kafka:0.11.0.1 -ti --command -- bash`



launch a new client to execute the kafka consumer
`kubectl exec -ti kafka-client-6c47c598c4-rtkkj -- ./opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka:9092 --topicoutput`


./bin/kafka-console-producer.sh --broker-list kafka:9092 --topic output

kubectl get pods --selector=run=kafka-client -o jsonpath='{.items[*].Name}'



This will show you how to deploy a kubernetes manifest to create a single pod with and image from the docker hub that span a simple hello-world web application

## Task

first you need to make sure you cluster is running so please run

`kubectl cluster-info`{{execute}}

then you need to get the data required for this workshop

`git clone https://github.com/sgandon/katacoda-scenarios.git; mv katacoda-scenarios/kubernetes-helm/assets/ talend`{{execute}}

deploy the pod into kubernetes
`cd talend/kubernetes/hello-world/
kubectl create -f deployment.yaml
`{{execute}}

watch the pod comming up
`kubectl get pods -w`{{execute}}

expose the service

`pod=$(kubectl get pod --selector=app=hello-world -o jsonpath={.items..metadata.name})
kubectl expose pod $pod --external-ip="[[HOST_IP]]" --port=8080 --target-port=80`{{execute}}


you can then try the service at

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


Add item to scale up the service.
