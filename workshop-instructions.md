# Self-hosted instructions:

## Minikube

### Supported operating systems:
* Linux
	* [x86-64](https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64), [ARM64](https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64), [ARMv7](https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm), [ppc64](https://storage.googleapis.com/minikube/releases/latest/minikube-linux-ppc64le), [S390x](https://storage.googleapis.com/minikube/releases/latest/minikube-linux-s390x)
	* Binary, .DEB, .RPM
* MacOS 
	* [x86-64](https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64), [ARM64](https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64)
	* Binary download, Homebrew
* Windows
	* X86-64
	* [.exe download](https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe), Windows package mgr, Chocolatey

### System requirements:

- 2 CPUs
- At least 2GB free memory
- 20GB disk
- Container or VM manager, like Docker, Hyperkit, Hyper-v, KVM, Podman, VirtualBox

Use the [MiniKube installation guide](https://minikube.sigs.k8s.io/docs/start/#what-youll-need) to find the appropriate download for your system & install the Stable version.

## Installation instructions:

## MacOS

### Using Homebrew

````
~] $ brew install minikube
````
### Binary download

````
~] $ curl -LO  \
	https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-$(VERSION)
````

````
~] $ sudo install minikube-darwin-$(VERSION) /usr/local/bin/minikube
````

## Linux 

### .deb package:

````
~] $ curl -LO \
	https://storage.googleapis.com/minikube/releases/latest/minikube_latest_$(ARCH).deb
````

````
~] $ sudo dpkg -i minikube_latest_$(ARCH).deb
````
### .rpm package:

````
~} $ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.$(ARCH).rpm
````
````
~] $ sudo rpm -Uvh minikube-latest.$(ARCH).rpm
````

### Binary download:

````
~] $ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$(VERSION)
````

````
~] $ sudo install minikube-linux-$(VERSION) /usr/local/bin/minikube
````

## Windows

### Windows Package Manager

````
~] $ winget install minikube
````

### Chocolatey package manager

````
~] $ choco install minikube
````

### .Exe installer

Download the latest [exe installer](https://storage.googleapis.com/minikube/releases/latest/minikube-installer.exe) & install following the prompts on screen.

## Start a cluster

Start a MiniKube cluster with the command:

````
~]$ minikube start –disk-size=${N}mb –cpus=${N} –kubernetes-version=v1.${N}
````

## kURL 
[System requirements:](https://kurl.sh/docs/install-with-kurl/system-requirements)

- 4 CPUs
- 8GB RAM
- 40GB disk
- TCP ports 2379, 2380, 6443, 6783, 10250, 10251 and 10252 open between cluster nodes
- UDP ports 6783 and 6784 open between cluster nodes

Install a single-node Kubernetes version 1.23.x cluster with kURL using the following command:

````
~]$ curl https://kurl.sh/latest | sudo bash
````

## ...Or just use Katacoda

If building a kubernetes cluster before the workshop isn’t your preferable route, simply sign up for a [Katacoda account]() using your email address for access to a preconfigured kubernetes cluster prepped for the day’s exercises. 