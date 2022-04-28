
## Making Trouble!

Now that kubernetes is up & running, lets make some trouble in the cluster:

* Lets run the following to create chaos:
`. install-trouble.sh`{{execute}}

* Once the troubled cluster is deployed, lets check it:
`kubectl get no`{{execute}}

You should see 3 nodes in the cluster.
