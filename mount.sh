#!/bin/sh
for d in archive pending; do
  local="$HOME/data/${d}-nas"

  if ! mount | grep -q $local; then
    sudo mount -t nfs -o vers=4 nas:/nas/$d $local
  fi
done