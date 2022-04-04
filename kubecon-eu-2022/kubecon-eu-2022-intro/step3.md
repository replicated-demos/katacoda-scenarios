
# All about sbctl 

* Now that `sbctl` proxy has connected, we are now able to pull `support-bundle` details directly from `kubectl`.

* Let's try to get the namespace 
`kubectl get namespace`{{execute}}

* We can also get a list of pods
`kubectl get pods`{{execute}}

As you can see, you can run almost any commands you can with regular bundle, with a few exceptions today.

The following resources need to be included:

* Logs
`kubectl logs <pod_name>`

* Config Maps
`kubectl get configmap`

* Secrets
`kubectl get secrets`