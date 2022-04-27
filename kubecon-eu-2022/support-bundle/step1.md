# Install `support-bundle`

The easiest way to [install](https://troubleshoot.sh/docs/#installation) `support-bundle` is to download the tarball from the project repo.

`curl -LO https://github.com/replicatedhq/troubleshoot/releases/latest/download/support-bundle_linux_amd64.tar.gz`{{execute}}

Untar it and move it to an executable location for `kubectl`

`tar -zxvf support-bundle_linux_amd64.tar.gz`{{execute}}

`mv support-bundle /usr/local/bin/kubectl-support_bundle`{{execute}}

# Test that support-bundle is working

If we try to get a bundle without specifying what we want to collect, we should get an error asking for it.

So instead lets try getting the version.

```
kubectl support-bundle version
```{{execute}}

We'll define a support bundle spec in the next step.
