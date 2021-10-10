## Custom Resource Definitions
`preflight` checks can be used to verify that `CustomResourceDefinition`s are present on the cluster. 

As an exercise, use the template provided in [troubleshoot.sh documentation](https://troubleshoot.sh/docs/analyze/crd/){open} to verify the existence of the `crontabs.stable.example.com` `CustomResourceDefinition` 

````
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: crd-example
spec:
  analyzers: []
````

