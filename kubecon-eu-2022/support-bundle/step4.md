We still have a broken app, but how can we know if it's something we've seen before or expect?
Better yet, how can we let a support-engineer or IT admin know what the problem is without calling a developer to interpret the output?

Turns out a fancy edge + machine-learning + blockchain + quantum app will only run on nodes with SOOPER-GPU™ hardware, and requires them to be labeled as such.
This would explain why none of the pods can be scheduled.
We also know that it's fine for a small cluster to only have one replica of this app running, so operators can ignore any other pending pods that might be waiting for a spare node.

Let's define some some customer **Analyzers**. 
One to check for the hardware prequisite, and another to check for the working deployment.
In contrast to `preflight`, we can now check _the runtime behavior of our deployed app_.

<pre class="file" data-filename="trouble-2.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: trouble-supportbundle
spec:
  collectors: 
  - logs:
      name: trouble app
      selector:
      - app=trouble
  analyzers:
  - nodeResources:
      checkName: Cluster must have sooper GPU nodes to run the trouble app
      filters:
        selector:
          matchLabel: 
            trouble/capability: sooper-gpu
      outcomes:
      - fail:
          when: "count() < 1"
          message: This cluster does not have a sooper GPU node and/or node-label.
      - pass:
          message: This cluster has a labeled sooper GPU node.
  - deploymentStatus:
      name: trouble
      namespace: trouble
      outcomes:
      - fail:
          when: "< 1"
          message: The Trouble deployment does not have any ready replicas.
      - pass:
          message: At least one replica of the Trouble deployment is ready.
</pre>

With the app still broken, let's run the this spec.

```bash
kubectl support-bundle trouble-2.yaml
tar zxf support-bundle-*.tar.gz -C support-bundle-data --strip-components=1
```{{execute}}

We can see the interactive output now tells us in plain language that are app won't run without the proper node labels.

To fix this cluster, add the proper node label.
```bash
kubectl label node node01 trouble/capability=sooper-gpu
```{{execute}}

If we wait a moment and re-run the support-bundle, now we can see our app is running as expected, even with only 1/2 replicas `Running`.
```bash
rm -rf support-bundle-*
kubectl support-bundle trouble-2.yaml
```{{execute}}

If we extract those results, we've got a new problem though... 
```bash
mkdir support-bundle-data
tar zxf support-bundle-*.tar.gz -C support-bundle-data --strip-components=1
```{{execute}}

If we take a look at the logs for the running pod, one of the devs is echoing our API secret in the logs (see `./support-bundle-data/trouble-app/<pod id>.log`)!
```
...
Contacting API with SOOPER_SECRET:cccccctteeeufbfeecdhrevfnrcbtgfcvikuhvvdllcj
...
```

This is also a problem, because the secret is a literal in our pod spec for the deployment.
`./support-bundle-data/cluster-resources/pods/trouble.json`{{open}}

While we're waiting for the dev team to fix the issue, let's make sure we don't leak this information again our final topic, **Redactors**.
