# Advanced Kubernetes Troubleshooting Made Simple with Open Source Tools 
![troubleshoot logo](../../assets/troubleshoot-logo.png)

## Customizing a Preflight check

Now that we've familiarized ourselves with the basics of [troubleshoot.sh](https://troubleshoot.sh), let's dive a little deeper into `preflight` checks.

Note: There *should* be a script running in the background to automatically reconfigure the `control plane` to the kubernetes `node`. If it does not work, connect the nodes by executing `launch.sh`{{execute}}.