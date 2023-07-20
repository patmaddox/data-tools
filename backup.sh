#!/bin/sh
set -e -o pipefail
snapshot=$(tmutil localsnapshot | grep -o '\d\d\d\d-\d\d-\d\d-\d\d\d\d\d\d')
mkdir -p /tmp/$snapshot
mount_apfs -s com.apple.TimeMachine.${snapshot}.local /System/Volumes/Data /tmp/$snapshot
rsync -a /tmp/${snapshot}${HOME}/data/pending-local/ nas:/nas/pending/$(hostname -s)
umount /tmp/$snapshot
rmdir /tmp/$snapshot
ssh nas "sudo sanoid --take-snapshots --quiet"
