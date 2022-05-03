#!/bin/bash

################################################
#Script name	:krew-installer.sh
#Description	:Installer script for the kubectl krew plugin
#Args		:
#Author		:T. Nichole Williams
#Email		:trilliams@replicated.com
#GitHub		:@OGtrilliams
#Website	:https://krew.sigs.k8s.io/docs/user-guide/setup/install/
##############################################
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
# step 2 - add path to BASH
echo "export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"" >> $HOME/.bashrc
# step 3 - profit
sleep 5
source ~/.bashrc
echo "Installation is complete. You are now ready to begin using krew."
