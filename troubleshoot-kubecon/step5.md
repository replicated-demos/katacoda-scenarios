Similar to `preflight`, `support-bundle` uses `yaml` files to define what information is collected & (optionally) analyze with `collectors`. 

## Customizing `support-bundle` collectors

Both `preflight` & `support-bundle` checks begin with a `collect` phase, where information is collected from the cluster, the environment, the application, & other sources to be used later for analysis or preflight results. `Collectors` defined in either a `preflight` or `support-bundle` `yaml` file can be used for essential troubleshooting tasks ranging from collecting `k8s` cluster info to collecting pod logs, to even writing static content to the host. 

The below example will collect default cluster data that is automatically included in the `collector` spec, as defined in line 6:


````
apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: katacoda-demo
spec:
  collectors: []
````

but additional parameters can be added to retrieve specific, detailed information from the host tailored to the clients' needs, & can even be combined with `analyzers` to streamline the support process even further. 

Let's create a `support-bundle` check that will create an archive containing the results of a `collector` while verifying that our Katacoda environment is compatible with our application.

Using your favorite text editor, create a new file named `greetings.yaml` with the following content:

````
apiVersion: troubleshoot.sh/v1beta2
kind: SupportBundle
metadata:
  name: katacoda-demo2
spec:
  analyzers:
    - clusterVersion:
        outcomes:
          - fail:
              when: "< 1.16.0"
              message: The application requires at least Kubernetes 1.16.0, and recommends 1.18.0.
              uri: https://kubernetes.io
          - warn:
              when: "< 1.18.0"
              message: Your cluster meets the minimum version of Kubernetes, but we recommend you update to 1.18.0 or later.
              uri: https://kubernetes.io
          - pass:
              message: Your cluster meets the recommended and required versions of Kubernetes.
    - nodeResources:
        checkName: Must have 1 node with 4 GB (available) memory and 2 cores (on a single node)
        filters:
          allocatableMemory: 4Gi
          cpuCapacity: "2"
        outcomes:
          - fail:
              when: "count() < 1"
              message: This application requires at least 1 node with 4GB available memory and 2 cpu cores
          - pass:
              message: This cluster has a node with enough memory and cpu cores
  collectors:
    - data:
        name: katacoda/greetings.txt
        data: |
          BREAKING NEWS

          You are amazing.
````

Once the file has been saved & closed, run the command `kubectl support-bundle ./greetings.yaml`{{execute}}. After you've reviewed the `preflight` `analyzer` results & exited back to the terminal,  you should find an archive with a name following the format, `support-bundle-$(date).tar.gz` available. 

Uncompress the archive with the command, `tar xvf support-bundle-*.tar.gz`{{execute}}

Once the `tar` command completes, let's take a look at what the custom `collector` included in `greetings.txt` created by running the command:

`cat support-bundle-*/katacoda/greetings.txt`{{execute}}

Surprise! That little breaking news announcement along with the new `katacoda` dir were created using a `support-bundle` `collector` appended to the bottom of `greetings.yaml`. That text can be replaced with anything, & while the example is silly it shows how powerful `support-bundle` can be.

A full list of `collectors` can be viewed `https://troubleshoot.sh/docs/collect/all/`{{open}}