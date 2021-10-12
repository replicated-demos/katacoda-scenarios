# Try It Yourself

Now that you've seen for yourself how `preflight` works, let's get a bit adventurous & try writing your own custom check.

The provided KataCoda k8s environment has the following specs:

```bash
RAM:2GiB
Disk: 191GiB
vCPUs: 2
controlplane $ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.5 LTS"
```

Using the predefined [troubleshoot.sh analyzers](https://troubleshoot.sh/docs/analyze/), create your own custom `preflight` check to verify anything your heart fancies.

```yaml
apiVersion: troubleshoot.sh/v1beta2
kind: Preflight
metadata:
  name: kubecon-troubleshoot-demo
spec:
  analyzers: []
```{{copy}}
