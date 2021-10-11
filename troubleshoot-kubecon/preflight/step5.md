## Try It Yourself

Now that you've seen for yourself how `preflight` works, let's get a bit adventurous & try writing your own custom check.

The KataCoda k8s environment has the following resources:


Using the predefined [troubleshoot.sh analyzers](https://troubleshoot.sh/docs/analyze/), write your own custom `preflight` check.

````
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: kubecon-troubleshoot-demo
spec:
  analyzers: []
````