# Run your first support-bundle

Now that the `support-bundle` plugin is installed, we can verify functionality by running an example check from `https://support-bundle.replicated.com`{{open}}:

`kubectl support-bundle https://support-bundle.replicated.com`{{execute}}

This will create a `.tar.gz` archive on our host with a filename like `support-bundle-$(date)` containing default cluster info along with results of a few `analyzers` we saw earlier in the exercise. It will also run a `preflight` `analyzer` which can be exited with the `q` key. Let's take a look at what's in our `support-bundle`:

`tar xvf support-bundle-*`{{execute}}

Note: This command may throw an error if more than one `support-bundle` exists on the cluster.

Once the archive is unpacked, change into the `support-bundle-$(date)` with the command:

`cd support-bundle-$(date)`

...but don't jump too far ahead. We'll learn more about the contents of collected `support-bundle` archives in the next lesson.