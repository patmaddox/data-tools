help:
  just -l

@backup:
  ./.pending-tools/lib/backup.sh

@log:
  echo "backup.log:"
  tail -n 4 .pending-tools/backup.log
  echo "canary.log:"
  ssh nas 'tail /nas/canary/canary.log && echo "now: $(TZ=UTC date)"'

@plans:
  find . -name plan.txt | sed 's|\./||'

@untracked:
  git status -unormal
