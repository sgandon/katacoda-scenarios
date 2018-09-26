`cd talend`{{execute}}
`clear; cat deployment.yaml`{{execute}}

then you deploy it 

`kubectl apply -f deployment.yaml`{{execute}}

then expose

`kubectl expose deployment hello-world --name=exposed-service --external-ip="[[HOST_IP]]" --port=80 --target-port=80`{{execute}}

you can then try the service at

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

The problem is that when refreshing the wbe page you can see that it is alway the same pod that is targeted.
Do you have any idea why ? is there some cache handling in the katacoda proxy ?