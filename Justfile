help:
  just -l

mount:
  ./lib/mount.sh

backup: mount
  ./lib/backup.sh

umount:
  ./lib/umount.sh

init:
  mkdir pending-local archive-local
