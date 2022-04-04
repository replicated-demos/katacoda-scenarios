# Let's debug the support bundle

Using this support bundle we will determine what is the rook ceph issue with this cluster and debug.

* Lets get a list of pods
`kubectl -n rook-ceph get po`{{execute}}

* In this output, you'll notice one of the pods is in `Pending` state, lets `describe pod`
`kubectl -n rook-ceph describe pod rook-ceph-mon-e-7db68fb77f-kkd4h`{{execute}}

* In the events you should see an output similar to:
```
Events:
  Type     Reason            Age        From  Message
  ----     ------            ----       ----  -------
  Warning  FailedScheduling  <unknown>        0/3 nodes are available: 3 node(s) didn't match node selector.
  ```

* Lets take a look at the list of nodes to see what is available:
  `kubectl get no`{{execute}}

* We can see that from the `describe` output the node selector does not match the available nodes.
  ```
  Node-Selectors:  kubernetes.io/hostname=localhost.localdomain
  ```

* This can be fixed by editing the `rook-ceph-mon-e` deployment.
  `kubectl -n rook-ceph edit deployment rook-ceph-mon-e`{{execute}}

Were you able to modify the node selector and save the file?