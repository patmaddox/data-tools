#!/bin/sh
set -e

for d in archive pending; do
  local="$(pwd)/${d}-nas"

  if mount | grep -q $local; then
    umount $local
  fi

  if [ -d $local ]; then
    rmdir $local
  fi
done
