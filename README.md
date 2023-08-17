# pending-tools

- System Settings -> Privacy & Security -> Full Disk Access -> Terminal (enabled)
- System Settings -> Privacy & Security -> Full Disk Access -> /usr/sbin/cron (enabled)

crontab:

```
SHELL=/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/local/bin
*/15 * * * * cd $HOME/pending && just backup
```
