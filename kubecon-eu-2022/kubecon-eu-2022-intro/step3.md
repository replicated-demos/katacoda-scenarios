# Let's debug this troubled cluster

There is an issue with the persistent store, volumes are being created but the cluster is in a degraded state.

* Lets get a list of all pods
`kubectl get po -A`{{execute}}

In this output, did you notice something weird?

* One of the pods seems to be in a `Pending` state, lets list the pods in that namespace.
`kubectl -n rook-ceph get po`{{execute}}

* Lets `describe` this pod in its pending state.
`kubectl -n rook-ceph describe pod rook-ceph-mon-b-67c7c8855f-fgmnk`{{execute}}

* Okay well we see what the issue is
```
Events:
  Type     Reason            Age        From  Message
  ----     ------            ----       ----  -------
  Warning  FailedScheduling  <unknown>        0/3 nodes are available: 3 node(s) didn't match node selector.
  ```
It looks like its unable to schedule this pod on one of the 3 available nodes in the cluster.

* Lets take a look at the list of nodes to see what is available:
  `kubectl get no`{{execute}}

* From the `describe` output above this is the node selector we see.
  ```
  Node-Selectors:  kubernetes.io/hostname=localhost.localdomain
  ```

Not really sure why this happened, probably our chaos script messed something up :)

Anyway, lets try to fix it and get this pod going.

