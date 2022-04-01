# Let's debug the support bundle

Using this support bundle we will determine what is the rook ceph issue with this cluster and debug.

Lets get a list of pods
`kubectl -n rook-ceph get po`{{execute}}

In this output, you'll notice one of the pods is in `Pending` state, lets `describe pod`
`kubectl -n rook-ceph describe pod rook-ceph-mon-e-7db68fb77f-kkd4h`{{execute}}

