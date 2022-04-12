# All About `support-bundle`

A support bundle is an archive that's created in-cluster, by collecting logs and cluster information, and executing specified commands (including redaction of sensitive information). After creating a support bundle, the cluster operator will normally deliver it to the 3rd-party application vendor for analysis and disconnected debugging. 

The `support-bundle` plugin collects data from the cluster, automatically redacting sensitive cluster info, then *optionally* analyzes the data to provide remediation steps.

The collected data is then stashed on the client host in a `.tar.gz` archive ready to be shared with support teams - saving precious time & streamlining the troubleshooting process. 

## Installation

Let's start by installing `support-bundle` using the `kubectl` `krew` plugin. 

`kubectl krew install support-bundle`{{execute}}

There shouldn't be any additional steps needed after installation, but just to be thorough, let's make sure that setup completed by running a demo `support-bundle`.