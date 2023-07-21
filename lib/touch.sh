#!/bin/sh
set -e

for d in archive pending; do
  touch $(pwd)/${d}-nas/.$(hostname -s)
done
