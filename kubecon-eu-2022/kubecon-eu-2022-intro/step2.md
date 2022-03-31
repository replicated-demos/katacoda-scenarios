
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

Installation is now complete! Now we’re ready to try it out:

`sbctl serve --support-bundle-location=supportbundle-example.tar.gz &`{{execute}}