#!/bin/sh
for d in archive pending; do
  local="$(pwd)/${d}-nas"

  if mount | grep -q $local; then
    sudo umount $local
  fi

  if [ -d $local ]; then
    rmdir $local
  fi
done
