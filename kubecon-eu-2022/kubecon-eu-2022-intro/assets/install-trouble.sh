#!/bin/bash

FILE=/usr/bin/sbctl
if [[ -f "$FILE" ]]; then
  sbctl shell -s supportbundle-example.tar.gz
else
  echo "Wait for cluster to become chaotic..."
fi

