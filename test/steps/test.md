`cd test/kubernetes`{{execute}}
`clear; cat deployment.yaml`{{execute}}

then you deploy it 

`kubectl apply -f deployment.yaml`{{execute}}

Wait for the pods to be created
then expose

`kubectl expose deployment hello-world --name=exposed-service --external-ip="[[HOST_IP]]" --port=80 --target-port=80`{{execute}}

you can then try the service at

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

The problem is that when refreshing the web page you can see that it is alway the same pod as an host name.
Do you have any idea why ? 

is there some cache handling in the katacoda proxy ?