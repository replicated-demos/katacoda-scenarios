
## Setting up Krew

Now that kubernetes is up & running we're ready to install [krew](https://krew.sigs.k8s.io/docs), the plugin manager for `kubectl`. Use this handy script to do the heavy lifting for you:

First, download `krew-installer.sh` to the `control-plane`:

`curl -o krew-installer.sh https://raw.githubusercontent.com/replicated-demos/katacoda-scenarios/main/troubleshoot-kubecon/ts-intro/krew-installer.sh`{{execute}}

Now, execute the script using `BaSH`:

`chmod +x krew-installer.sh && . krew-installer.sh`{{execute}}

Once the script finishes running, let's verify that it is working correctly by running a simple command:

`kubectl krew -h`{{execute}}

If you receive an error message stating that the plugin isn't found, run `source ~/.bashrc`{{execute}} to refresh the terminal window, then try running kubectl krew -h again.

Now that `krew` plugin has been added to `kubectl`, we're ready to install `preflight`. 
