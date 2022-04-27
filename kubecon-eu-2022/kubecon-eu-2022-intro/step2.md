
## Setting up Sbctl

Now that kubernetes is up & running we're ready to install pre-requiusites:

* You should see two tarballs downloaded in the `control-plane`: one for `sbctl` and an example support bundle:

* Now, lets untar the sbctl tar ball:
`tar -zxvf sbctl_linux_amd64.tar.gz`{{execute}}

* Once the archive is unpacked, let's move it to an executable location.
`mv sbctl /usr/bin`{{execute}}

* Verify that it is working correctly by running a simple command:
`sbctl -h`{{execute}}

Installation is now complete! You can run the `sbctl shell` which will setup the kubeconfig environment:
`sbctl shell --support-bundle-location=supportbundle-example.tar.gz`{{execute}}

Once the support bundle is served, test with a command:
`kubectl get no`{{execute}}
