help:
  just -l

mount:
  ./lib/mount.sh

backup: mount
  ./lib/backup.sh
