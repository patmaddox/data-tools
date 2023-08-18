help:
  just -l

@backup:
  ./.pending-tools/lib/backup.sh

@exports:
  find . -path '*/exports/*' -type f | sed 's|^./||'

@id:
  date "+%y%m%d%H%M%S"

@log:
  echo "now: $(TZ=UTC date)"
  echo "backup.log:"
  tail -n 4 .pending-tools/backup.log
  echo "canary.log:"
  ssh nas 'tail /nas/canary/canary.log'

@plans:
  find . -name plan.txt | sed 's|\./||'

@untracked:
  git status -unormal
