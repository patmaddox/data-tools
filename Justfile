help:
  just -l

mount: init
  @./lib/mount.sh

backup: mount
  @./lib/backup.sh

umount:
  @./lib/umount.sh

init:
  @mkdir -p pending-local archive-local
