# Lets Fix the issue

We saw the node selector is currently set to `localhost.localdomain`, but we have 3 nodes, which one should we set this to?

* We see there are three `rook-ceph-mon-*` deployments, which nodes are the others scheduled on?
`kubectl -n rook-ceph describe po rook-ceph-mon-a-85546b9c7d-nkv2f rook-ceph-mon-b-67c7c8855f-fgmnk rook-ceph-mon-c-fd46dd84d-xmqsr | grep Node-Selectors`{{execute}}

* We see `rook-ceph-mon-a-*` on Node 1 and `rook-ceph-mon-b-*` on some localhost node and `rook-ceph-mon-c-*` on Node 3. So that means we are missing Node 2, this can be fixed by editing the `rook-ceph-mon-b` deployment.
  `kubectl -n rook-ceph edit deployment rook-ceph-mon-b`{{execute}}

* Well this is an unexpected error, is `vi` not installed perhaps or not in PATH

```
error: unable to launch the editor "vi"
```

* Lets try to shell into one of the other running mon pod containers and see if we can see ceph status
`kubectl -n rook-ceph exec -it rook-ceph-mon-a-85546b9c7d-nkv2f -- /bin/bash`{{execute}}

This looks very ominous
```
Defaulted container "mon" out of: mon, init-mon-fs (init)
called getNotFound
POST /api/v1/namespaces/rook-ceph/pods/rook-ceph-mon-a-85546b9c7d-nkv2f/exec?command=%2Fbin%2Fbash&container=mon&stdin=true&stdout=true&tty=true
Error from server:
```

