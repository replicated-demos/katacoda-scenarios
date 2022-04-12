#!/bin/bash

################################################
#Script name	:krew-installer.sh
#Description	:Installer script for the kubectl krew plugin
#Args		:
#Author		:T. Nichole Williams
#Email		:tribecca@tribecc.us
#GitHub		:@OGtrilliams
#Website	:https://krew.sigs.k8s.io/docs/user-guide/setup/install/
##############################################
(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')" &&
  "$KREW" install krew
)
# step 2 - add path to BASH
echo "export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"" >> $HOME/.bashrc
# step 3 - profit
sleep 5
source ~/.bashrc
echo "Installation is complete. You are now ready to begin using krew."
