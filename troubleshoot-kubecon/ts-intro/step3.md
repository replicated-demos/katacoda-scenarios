
# All About Preflight

`Preflight` is a powerful little tool that can be used to verify that client environments are properly configured to support your application(s).

Installation of `preflight` can be done in one step with help from the `krew` installer:

`kubectl krew install preflight`{{execute}}

Note: This will not install anything to your cluster, it only places a single binary per plugin in your path.

Once installation completes, we can verify that `preflight` is running using the example check available at [https://preflight.replicated.com](https://preflight.replicated.com).

The example check we are going to run has `analyzers` configured to verify k8s cluster version & minimum nodes, Docker container runtime, storage class, as well system resources such as RAM, CPUs & disk for a minimal Kubernetes production cluster. 

## What are Analyzers?

`Analyzers` are `YAML` specifications that define a set of criteria and operations to run against data collected in a `preflight` check or support bundle. Each `analyzer` included will result in either `0` or `1` outcomes. If an `analyzer` produces zero outcomes, it will not be displayed in the results.

Let's go ahead & run the example check to see `preflight` in action:

`kubectl preflight https://preflight.replicated.com`{{execute}}

Use the `^` & `˅` keys to navigate through the results. When you're done, press `q` to exit back to the terminal.
