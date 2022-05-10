
# Installing trouble

* Lets run the following to create chaos

`. install-trouble.sh`{{execute}}

While our environment is warming up, let's briefly discuss what we set up. We used the [Troubleshoot.sh](https://troubleshoot.sh) `support-bundle` tool to collect a set of log files from a broken cluster.

Using the logs that we collected before hand, we proxy it though a tool we wrote called `sbctl` (support bundle control) to review those log files just like a Kubernetes cluster. This has been setup here on this playground and all of the `kubectl` results you are seeing here are from `sbctl`!

This makes troubleshooting significantly faster, let me show you with this cluster in the environment as we look at the problem with this cluster.

## About the Presenters

[Treva N. Williams](https://github.com/OGtrilliams) - Developer Evangelist / Community Manager | Replicated

[AJ](https://github.com/aj-jester) - Foundational Engineer (FDE and CRE Teams) | Replicated

[Sir Hairold B. Goggington III](https://twitter.com/sirhairold) - Branch Manager 
