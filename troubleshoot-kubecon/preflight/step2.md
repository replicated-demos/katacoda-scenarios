# Customizing a preflight Check

To begin, let's edit `preflight.yaml` to add an `analyzer` under `spec:` to verify that Kubernetes is up to date:

````
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: preflight-tutorial
spec:
  analyzers:
    - clusterVersion:
        outcomes:
          - fail:
              when: "< 1.18.0"
              message: The application requires at least Kubernetes 1.18.0, and recommends 1.20.0.
              uri: https://kubernetes.io
          - warn:
              when: "< 1.19.0"
              message: Your cluster meets the minimum version of Kubernetes, but we recommend you update to 1.19.0 or later.
              uri: https://kubernetes.io
          - pass:
              message: Your cluster meets the recommended and required versions of Kubernetes.
````

First, we specify the `analyzer` type, in this case it is `ClusterVersion`, which will be evaluated by the `preflight` checks once we run the updated check. In the following lines, we define `pass`, `fail`, and `warn` parameters for our check.


