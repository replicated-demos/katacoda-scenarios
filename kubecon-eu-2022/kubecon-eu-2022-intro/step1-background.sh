#!/bin/bash
. launch.sh

curl -LO https://github.com/replicatedhq/sbctl/releases/latest/download/sbctl_linux_amd64.tar.gz
curl -LO https://github.com/replicated-demos/katacoda-scenarios/raw/main/kubecon-eu-2022/kubecon-eu-2022-intro/assets/supportbundle-example.tar.gz

tar -zxvf sbctl_linux_amd64.tar.gz
mv sbctl /usr/bin
