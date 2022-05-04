# The Jig is up!

## What happened?
I have to admit, the "real" cluster has been fixed several weeks ago. :)

What we actually did here is troubleshoot the cluster which was in a degraded state at one point, we were basically using logs from the cluster that were collected several weeks ago.

## How did this work?

The script that we initially ran `install-trouble.sh` was actually just serving up an API server interfacing between Kubetentes json log files and `kubectl` cli, we call this `sbctl`.
`ls -l && cat install-trouble.sh`{{execute}}

Think of `sbctl` as a virtual cluster that uses pre-collected logs from Kubernetes environments you may or may not have access to to serve up resources that can be queried with `kubectl` that everyone is familiar with.

## Internally how is `sbctl` serving the json logs?

It starts up a local API server referencing a support bundle and then `kubectl` points to this local API server to run requests against. Of course there are some limitations with this and we are constantly improving its capabilities.

* Let's try to get the namespace 
`kubectl get namespace`{{execute}}

* We can also get a list of pods
`kubectl get pods`{{execute}}

As you can see, you can run almost any commands you can with a regular cluster, with a few exceptions today.

The following resources need to be supported in the future:

* Logs
`kubectl logs <pod_name>`

* Config Maps
`kubectl get configmap`

* Secrets
`kubectl get secrets`

* Exec (because the pod is physically not there)
`kubectl exec`

* Edit (of course because the pod is not physically not there)
`kubectl edit`

* PV
`kubectl pv`

We would love for some of you to help us bridge the gap with some of these features.
- [https://github.com/replicatedhq/sbctl/](https://github.com/replicatedhq/sbctl/)

## Generating Support Bundles

That's great, but how do we generate one of these support bundles ourselves so we could try `sbctl`?

That's next! Let's take a tour of `troubleshoot.sh` Analyzer and Collectors in the next scenario to generate your own support bundles to use with `sbctl`!

- [Troubleshoot](http://troubleshoot.sh/)


