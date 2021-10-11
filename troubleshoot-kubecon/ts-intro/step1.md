## About Replicated
![replicated logo](../../assets/replicated-logo-red.png)

Founded in 2015 by Marc Campbell and Grant Miller, Replicated seeks to modernize on-prem software for the cloud-native era by providing commercial and open source tools to streamline the distribution and management of 3rd-party applications in complex enterprise environments.

In October 2020, the Replicated team celebrated raising `$25 million dollars` in Series B funding to further accelerate work of modernizing on-prem Kubernetes software, including (but certainly not limited to):

- [kURL](http://kurl.sh/): a framework for creating custom k8s distros that can be shared via cURL URLS or as downloadable packages. 
- [KOTS (Kubernetes off-the-shelf) software](https://kots.io/): a `kubectl` plugin & admin console that helps manage preflight, install, support & upgrade of 3rd-party K8s software
- [Troubleshoot](http://troubleshoot.sh/): a framework for collecting, redacting, and analyzing highly customizable diagnostic information about a Kubernetes cluster.

## Introduction to Troubleshoot.sh

**Troubleshoot** by Replicated is an Open Source framework for collecting, redacting, and analyzing highly customizable diagnostic information about a Kubernetes cluster. 

The framework is accessed via two `kubectl` plugins: `kubectl` `preflight` & `kubectl` `support-bundle`. `Preflight` provides pre-installation cluster conformance testing and validation and `support-bundle` provides post-installation troubleshooting and diagnostics.

Let's take a tour of `troubleshoot.sh` in this interactive demo. 


## Environment setup

Before we get started, let's first complete setup of our `kubernetes` environment by running `launch.sh`{{execute}}. This script will automatically connect the k8s `controlplane` to the k8s `node` launched when we requested the environment. It will take 2-5 minutes to complete.

While that's running, let's introduce today's speakers.

## About the Presenters

[Treva N. Williams](https://github/OGtrilliams) - Developer Evangelist / Community Manager | Replicated

[Kyle Sorensen](https://github.com/kylesorensen) - Core Engineer | Replicated

[Dan Stough](https://github.com/danstough) - Core Engineer | Replicated

[Sir Hairold B. Goggington III](https://twitter.com/sirhairold) - Branch Manager 