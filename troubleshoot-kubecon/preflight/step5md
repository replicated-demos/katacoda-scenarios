## Custom Resource Definitions

`preflight` checks can be used to verify that a critical (or not-so critical, whatever) `CustomResourceDefinition` is present on the cluster. 

As an exercise, with the template provided below, use [troubleshoot.sh documentation](https://troubleshoot.sh/docs/analyze/){open} to verify the existence of the `crontabs.stable.example.com` `CustomResourceDefinition` 

```yaml
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: crd-example
spec:
  analyzers: []
```{{copy}}

