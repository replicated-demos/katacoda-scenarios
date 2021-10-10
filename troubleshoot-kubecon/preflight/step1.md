## Creating custom Preflight checks

### If you can write `yaml`, you can make your own `preflight` check.

As mentioned in the previous scenario, `Preflight` checks can be customized to suit your organizational needs using any number of [analyzers](https://troubleshoot.sh/docs/analyze/). Let's practice by creating our own `preflight.yaml` to suit the Katacoda environment.

On the `controlplane`, create a new file named `preflight.yaml` with the following content:

````
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: preflight-tutorial
spec:
  analyzers: []
````

This is the starter framework of our check. You can run the check as-is with the command `kubectl preflight ./preflight.yaml`{{execute}} however this won't return much useful info as we have not specified any `analyzers`. 

Let's fix that by adding some `analyzers` from [here](https://troubleshoot.sh/docs/analyze/).