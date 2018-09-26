Namespaces are mean to segragate resources and apply different resource policies.
You cannot have resources with the same name inside a namespace but it is perfectly fine in another namespace.

let's try to list namespaces

`kubectl get namespaces`{{execute}}

then you can look at the resources deployed in those namaspaces

`kubectl get po,svc -n kube-system`{{execute}}

or in all namespaces

`kubectl get po --all-namespaces`{{execute}}

Advise : if you work with multiple clusters, use a tool called [kubens](https://github.com/ahmetb/kubectx) to avoid specifying the namespace for every command.