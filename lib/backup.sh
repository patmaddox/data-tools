#!/bin/sh
set -e -o pipefail
echo "BEG: $(date)" >> backup.log
snapshot=$(tmutil localsnapshot | grep -o '\d\d\d\d-\d\d-\d\d-\d\d\d\d\d\d')
mkdir -p /tmp/$snapshot
mount_apfs -s com.apple.TimeMachine.${snapshot}.local /System/Volumes/Data /tmp/$snapshot > /dev/null 2>&1
rsync -a /tmp/${snapshot}${HOME}/data/pending-local/ nas:/nas/pending/$(hostname -s)
umount /tmp/$snapshot
rmdir /tmp/$snapshot
ssh nas "sudo sanoid --take-snapshots --quiet"
echo "END: $(date)" >> backup.log
