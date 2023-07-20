#!/bin/sh
for d in archive pending; do
  local="$(pwd)/${d}-nas"

  if [ ! -d $local ]; then
    mkdir $local
  fi

  if ! mount | grep -q $local; then
    sudo mount -t nfs -o vers=4 nas:/nas/$d $local
  fi
done
