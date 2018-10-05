Namespaces are a way to segregate resources and apply different resource policies.
You cannot have resources with the same name inside a namespace but it is perfectly fine in another namespace.

Let's try to list namespaces:

`kubectl get namespaces`{{execute}}

Then you can look at the resources deployed in a specific namespace:

`kubectl get po,svc -n kube-system`{{execute}}

Or in all namespaces:

`kubectl get po --all-namespaces`{{execute}}

Advise : if you work with multiple clusters, use a tool called [kubens](https://github.com/ahmetb/kubectx) to avoid specifying the namespace for every command.

