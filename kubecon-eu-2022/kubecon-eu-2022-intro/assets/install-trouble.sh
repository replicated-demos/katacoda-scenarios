#!/bin/bash

FILE=/usr/bin/sbctl
if [[ -f "$FILE" ]]; then

  ps aux | grep -i sbctl | grep -v grep > /dev/null 2>&1

  if [[ $? -eq 1 ]]; then
    echo "CHARLIE FOXTROT IS READY!"
    sbctl shell -s supportbundle-example.tar.gz

  else
    echo "Woah!!! There is already too much chaos :)"
  fi

else
  echo "Waiting for cluster to become chaotic...try again..."
fi

