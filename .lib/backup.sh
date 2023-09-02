#!/bin/sh
set -e -o pipefail
backup_log=.lib/backup.log
echo "BEG: $(TZ=UTC date)" >> $backup_log
snapshot=$(tmutil localsnapshot | grep -o '\d\d\d\d-\d\d-\d\d-\d\d\d\d\d\d')
mkdir -p /tmp/$snapshot
mount_apfs -s com.apple.TimeMachine.${snapshot}.local /System/Volumes/Data /tmp/$snapshot > /dev/null 2>&1
rsync -a --delete --exclude-from=.lib/rsync-ignore /tmp/${snapshot}${HOME}/local-files/ nas:/nas/$(hostname -s)/
umount /tmp/$snapshot
rmdir /tmp/$snapshot
tmutil deletelocalsnapshots $snapshot > /dev/null
ssh nas "TZ=UTC sudo sanoid --take-snapshots --quiet"
echo "END: $(TZ=UTC date)" >> $backup_log
