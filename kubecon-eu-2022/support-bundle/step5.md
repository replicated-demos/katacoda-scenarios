We define [**Redactors**](https://troubleshoot.sh/docs/redact/redactors/) to filter out sensitive data in our support bundles.
There are a number of redactors already built into `support-bundle`, like [IP addresses](https://troubleshoot.sh/docs/redact/ip-addresses/) and [passwords](https://troubleshoot.sh/docs/redact/passwords/).
In our case, we need to add a `Redactor` document to our support-bundle spec for our custom API token.

<pre class="file" data-filename="trouble-3.yaml" data-target="replace">apiVersion: troubleshoot.sh/v1beta2
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
---
apiVersion: troubleshoot.sh/v1beta2
kind: Redactor
metadata:
  name: sooper-secrets
spec:
  redactors:
  - name: Redact values for environment variables that look our SOOPER_SECRET key
    removals:
      regex:
      - redactor: '(?i)([^\"]*SOOPER_SECRET:)(?P&lt;mask&gt;[^\"]*)'
  - name: Redact SOOPER secret values in multiline JSON (like manifests)
    removals:
      regex:
      - selector: '(?i)"name": *"[^\"]*SOOPER_?SECRET[^\"]*"'
        redactor: '(?i)("value": *")(?P&lt;mask&gt;.*[^\"]*)(")'
</pre>

Let's run the the final spec!
This time we'll use the `interactive=false` flag and pipe to `jq` so we can mimic using the output programmatically.

```bash
rm -rf support-bundle*
mkdir support-bundle
kubectl support-bundle trouble-3.yaml --interactive=false | jq
tar zxf support-bundle-*.tar.gz -C support-bundle-data --strip-components=1
```{{execute}}

If we look at the logs output now (see `./suppport-bundle/trouble-app/<pod id>.log`), we can see the token is redacted. 
It has also been redacted in our k8s cluster-resources: 
`./support-bundle-data/cluster-resources/pods/trouble.json`{{open}}

Now even if a dev leaks this information, we don't need to worry about transmitting it in our support bundles.
