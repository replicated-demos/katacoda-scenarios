#!/bin/bash
# background preparation script for preflight lesson

echo "Welcome back! Please give a few minutes for the background script to complete setup of your environment."


. launch.sh

wait 30

mkdir scripts

curl -o ~/scripts/krew-installer.sh https://raw.githubusercontent.com/OGtrilliams/katacoda-scenarios/main/replicated-demo/krew-installer.sh

chmod +x ~/scripts/krew-installer.sh
/bin/bash ~/scripts/krew-installer.sh

wait 10

source ~/.bashrc

/usr/bin/kubectl krew install preflight
