Generating a support bundle requires you to specify the information you'd like to collect from the cluster that's relevant to troubleshooting your application.

To get started, let's create a minimal `support-bundle` [spec](https://troubleshoot.sh/docs/support-bundle/collecting/):

**NOTE**: Sometimes it takes a minute for VS Code to warm up in the `IDE` tab. 
If the file doesn't copy over, try again after a minute.

<pre class="file" data-filename="support.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: supportbundle-tutorial
spec:
  collectors: []
  analyzers: []
</pre>

We use **Collectors** to define the information we will gather from the system (both the cluster and the host).
We use **Analyzers** to determine the pass/warn/fail outcomes we expect as application and infrastructure maintainers.
Even thought this spec does not define any of these items, by default the [Cluster Info](https://troubleshoot.sh/docs/collect/cluster-info/) and [Cluster Resources](https://troubleshoot.sh/docs/collect/cluster-resources/) are included, which will get us a general picture of the state of the cluster.

Now get that bundle!
`kubectl support-bundle support.yaml`{{execute}}

This generates an archive in the user's `$HOME` directory. 
We can expand this by running the following (which will also remove the time-stamped directory): 
`tar zxf support-bundle*.tar.gz -C support-bundle --strip-components=1`{{execute}}

If you visit the `support-bundle` folder in the IDE tab, you should see we have a mostly-full description of the state of our cluster and what's running in it, minus some potentially sensitive information (we'll cover **Redactors** in future step).

For example, which version of Kubernetes are we running? 
`./support-bundle/cluster-info/cluster_version.json`{{open}} 
This file will tell us! 

Can you get this information from `kubectl`? 
YES.

Do you want to have to give the person on the other side of a Zoom debug session all the `kubectl` commands manually? 
NOPE!

For a more advanced `spec`, you can check at the examples or [this one](https://github.com/replicatedhq/kots/blob/master/pkg/supportbundle/defaultspec/spec.yaml) used for on-premise Kubernetes clusters with [KOTS](https://kots.io/).

Let's use a support bundle to diagnose issues with a running application.
