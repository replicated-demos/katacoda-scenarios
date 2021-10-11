Now let's debug an application running in production!

We've started an app in the cluster that is having some problems.
`support-bundle` will allow us to collect all the information we need to triage issues in one fell swoop.

Our application should be running as a **Deployment** in the `trouble` **Namespace**. 
It has the following pod label: `app=trouble`. 

Let's create a custom `support-bundle` spec, `trouble-1.yaml`, that grabs the logs for this app.
We can use the [Pod Logs Collector](https://troubleshoot.sh/docs/collect/logs/) to gather this infomation

<pre class="file" data-filename="trouble-1.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: trouble-supportbundle
spec:
  collectors: 
  - logs:
      name: trouble-app
      selector:
      - app=trouble
</pre>

Let's collect the bundle and extract it.

```bash
kubectl support-bundle trouble-1.yaml
tar zxf support-bundle*.tar.gz -C support-bundle --strip-components=1
```{{execute}}

Hmm, all the log files under `./support-bundle/trouble-app` are empty! 🤔

**NOTE**: If you don't have a directory `./support-bundle/trouble-app`, yoru app deployment might have failed. Run `. install-trouble.sh` to re-install the application.

Let's continuing digging in the other information we collected.
Each path under `cluster-resources` corresponds to a `<resource>/namespace.json` for namespaced resources, or <resource>/.json for cluster-level resources.

If we review `./support-bundle/cluster-resources/deployments/trouble.json`{{open}} , we can see there are two unavailable replicas for the application.

We can also see under `./support-bundle/cluster-resources/events/trouble.json`{{open}}, that these pods failed to schedule because no node matched the node selector in the deployment. 

Although we have all the information we need in this bundle to figure out the issue, we can do better, knowing our app requirements and its desired working state.
In the next step will see if we catch this error directly in the output using **Analyzers**.
