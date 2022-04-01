
## Setting up Sbctl

Now that kubernetes is up & running we're ready to install pre-requiusites:

First, download `sbctl` to the `control-plane`:

`curl -LO https://github.com/replicatedhq/sbctl/releases/latest/download/sbctl_linux_amd64.tar.gz`{{execute}}

Now, untar the sbctl tar ball `BaSH`:
`tar -zxvf sbctl_linux_amd64.tar.gz`{{execute}}

Once the archive is unpacked, let's move it to an executable location.

`mv sbctl /usr/bin`{{execute}}

Verify that it is working correctly by running a simple command:

`sbctl -h`{{execute}}

Lets fetch the support bundle.

`. get-supportbundle.sh`{{execute}}

Installation is now complete! you’re ready to run the `sbctl` command, which will proxy a connection to the kubernetes API & also print out location of a new kubeconfig file for as long as the connection is open. If you’re unable to open a new terminal window to connect to the instance, you can shift the sbctl serve command to the background by appending an `&` to the end of the command, then hit the ENTER key to return to command line as shown below:

`sbctl serve --support-bundle-location=supportbundle-example.tar.gz &`{{execute}}

Once the support bundle is served, there should be an export command generated, please run this in the `control-panel`, for example:
`export KUBECONFIG=/tmp/local-kubeconfig-...`
TODO: Send it to background script.