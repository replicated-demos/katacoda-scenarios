## Custom Resource Definitions
`preflight` checks can be used to verify that `CustomResourceDefinition`s are present on the cluster. Let's try it out.

````
  analyzers:
    - customResourceDefinition:
        customResourceDefinitionName: crontabs.stable.example.com
        outcomes:
          - fail:
              message: The CRD was not found in the cluster.
          - pass:
              message: Cron is installed and available.
````
