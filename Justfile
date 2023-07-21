help:
  just -l

mount:
  @./lib/mount.sh

backup:
  @./lib/backup.sh

umount:
  @./lib/umount.sh

init:
  @mkdir -p pending-local archive-local

check: mount
  @ls {archive,pending}-nas/_NAS > /dev/null 2>&1 || (echo 'missing _NAS file - not connected?' && exit 1)

log: check
  @echo "backup.log:"
  @tail -n 4 backup.log
  @echo "canary.log:"
  @ssh nas 'tail /nas/canary/canary.log && echo "now: $(TZ=UTC date)"'
