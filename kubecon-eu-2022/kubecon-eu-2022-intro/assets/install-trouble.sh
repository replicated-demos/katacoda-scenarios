#!/bin/bash

FILE=/usr/bin/sbctl
if [[ -f "$FILE" ]]; then
  echo "CHAOS IS READY!!!!"
  sbctl shell -s supportbundle-example.tar.gz
else
  echo "Wait for cluster to become chaotic..."
fi

