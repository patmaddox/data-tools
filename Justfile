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

touch: mount
  @./lib/touch.sh
