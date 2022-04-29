#!/bin/bash

FILE=/usr/bin/sbctl
if [[ -f "$FILE" ]]; then

  ps aux | grep -i sbctl | grep -v grep

  if [[ $? -eq 1 ]]; then
    echo "CHAOS IS READY!!!!"
    sbctl shell -s supportbundle-example.tar.gz

  else
    echo "There is already too much chaos :)"
  fi

else
  echo "Wait for cluster to become chaotic...try again..."
fi

