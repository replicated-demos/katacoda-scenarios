# Install `support-bundle`

The easiest way to [install](https://troubleshoot.sh/docs/#installation) `support-bundle` is use [krew](https://krew.dev/), the kubectl plugin manager. The following script will run the krew installer and put it on the `$PATH`.

`. krew.sh`{{execute}}

With `krew` installed, the install is as easy as: `kubectl krew install support-bundle`{{execute}}

# Test that support-bundle is working

If we try to get a bundle without specifying what we want to collect, we should get an error asking for it.

```
kubectl support-bundle
```{{execute}}

We'll define a support bundle spec in the next step.
