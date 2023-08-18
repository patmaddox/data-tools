# pending-tools

- System Settings -> Privacy & Security -> Full Disk Access -> Terminal (enabled)
- System Settings -> Privacy & Security -> Full Disk Access -> /usr/sbin/cron (enabled)

## cron

```
SHELL=/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/local/bin
*/15 * * * * cd $HOME/pending && just backup
```

`.ssh/config`:

```
Host nas
  Usekeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

`ssh-add --apple-use-keychain ~/.ssh/id_ed25519`

## /etc/nfs.conf

`nfs.client.mount.options = vers=4`

## git config

`git config status.showUntrackedFiles no`
