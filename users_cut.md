# Little bit about users using cut command

To find the users (local) on the system run the following command

```shell
cut -d: -f1 /etc/passwd
```

## Lets find the user and its shell

cut -d: -f1,7 /etc/passwd

## Services which start at boot

sudo systemclt list-unit-files --state=enabled # but this does not tell if the service is active

## List the crontab per user
use the bash file cronjobusers.sh

## List global tasks

sudo systemclt list-timers
sudo ls -l /etc/cron*
