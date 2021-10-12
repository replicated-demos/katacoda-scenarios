## Checking System Resources

Let's take our first check a step further by adding an additional  `analyzer` for `nodeResources`. 

Edit `preflight.yaml` with the following:

note: if you're using `vim` - the superior terminal text editor - use the command `:set ai` to configure auto indentation.

```yaml
    - nodeResources:
        checkName: Must have 1 node with 4 GB (available) memory and 2 cores (on a single node)
        filters:
          allocatableMemory: 2Gi
          cpuCapacity: "2"
        outcomes:
          - fail:
              when: "count() < 1"
              message: This application requires at least 1 node with 4GB available memory and 2 cpu cores
          - pass:
              message: This cluster has a node with enough memory and cpu cores
```{{copy}}

The above `analyzer` will verify that the Katacoda environment we are working in has deployed a single worker node with at least 2GB of RAM & 2 vCPU cores available. Add it under `spec`.

Save & close the file, then see the results of our check by running the command:

`kubectl preflight ./preflight.yaml`{{execute}}
