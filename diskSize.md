# Disk Size

First find the mount which is consume more space

du -sh /var/* | sort -h
nb: The most important part, i'm going to forget and it is putting `*`, infront of
of the directory.
The output looks like below 

```shell
0	/var/account
0	/var/adm
797M	/var/cache
0	/var/crash
0	/var/db
0	/var/empty
0	/var/ftp
0	/var/games
0	/var/kerberos
7.3G	/var/lib
0	/var/local
4.0K	/var/lock
721M	/var/log
4.0K	/var/mail
0	/var/nis
0	/var/opt
0	/var/preserve
4.0K	/var/run
43M	/var/spool
0	/var/tmp
0	/var/www
0	/var/yp
```

The directory `/var/lib` is the one which consumes more space,
try du -sh /var/lib/* without star after lib, won't give more information

```shell
sudo du -sh /var/lib/* | sort -h | tail
1.6M	/var/lib/passim
1.9M	/var/lib/fwupd
2.5M	/var/lib/sss
2.9M	/var/lib/gdm
4.4M	/var/lib/dnf
19M	/var/lib/selinux
20M	/var/lib/plocate
22M	/var/lib/systemd
525M	/var/lib/docker
6.7G	/var/lib/flatpak # consumes the most space
```



