# sbctl sudo virtual cluster

* Internally how is sbctl serving the support bundle?
It starts up a local API server referencing the pre-generated support bundle and then kubectl can be pointed at this local API server to run commands against and it will work like a virtual cluster. Of course there are some limitations with this and we are constantly improving its capabilities.

[https://github.com/replicatedhq/sbctl/](https://github.com/replicatedhq/sbctl/)
