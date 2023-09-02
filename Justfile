help:
  just -l

@backup:
  ./.lib/backup.sh

@cleansnaps:
  tmutil listlocalsnapshots / | grep -o '\d\d\d\d-\d\d-\d\d-\d\d\d\d\d\d' | xargs -I {} -n 1 tmutil deletelocalsnapshots {}

@exports:
  find . -path '*/exports/*' -type f | sed 's|^./||'

@notes:
  find . -iname 'notes.*' -type f | sed 's|^./||'

@id:
  date "+%y%m%d%H%M%S"

@log:
  echo "now: $(TZ=UTC date)"
  echo "backup.log:"
  tail -n 4 .lib/backup.log
  echo "canary.log:"
  ssh nas 'tail /nas/canary/canary.log'

@plans:
  find . -name plan.txt | sed 's|\./||'

@untracked:
  git status -unormal
