# SSH Keys and its security

$HOME/.ssh/authorized_keys is the home folder of the user on the server you want to log into.
That file will contain the SSH public key of authorized users.

## What is possible with ssh-keygen?

Find the finger prints

```shell
ssh-keygen -lf ~/.ssh/id_dposeidon_satorni.pub
256 SHA256:w3rqhP23t+6NGWJ3eTNDDL8mEgt6gRf7XuRC2nUExwg dposeidon__satorni2025-05-09 (ED25519)
# remove obselete key using IP Address of the host
ssh-keygen -R 192.168.50.145
```

## What is possible with ssh-keyscan?

you want to populate all keys from remote hosts into your .ssh/knownhosts

`ssh-keyscan -t fqdnOfTheHost|IPAddressOfTheHost >> $HOME/.ssh/known_hosts`

## How to add revoked key ?

```shell
echo "textOfTheRevokedKey" >> /etc/ssh/revoked_keys
sshd -T | grep revokedkeys # -T option is for testing
revokedkeys none
```

## What is AuthorizedKeysCommand?

Refer :[How to use AuthorizedKeysCommand](https://gist.github.com/sivel/c68f601137ef9063efd7)

## AllowUsers think about it

AllowUsers by default is not present in sshd_config but
you can use it to restrict login to specific user.
More information is available on the man pages
`AllowUsers nodiesop mediumdeploy`

### Find keys which are older than 90 days

`find $HOME/.ssh/ -mtime +90 -exec echo "older than 90 days" {} \;`

#### Little bit about -mtime

You can write -mtime 6 or -mtime -6 or -mtime +6:

Using 6 without sign means "equal to 6 days old — so modified between

```shell

now - 6 * 86400 and now - 7 * 86400 # (because fractional days are discarded).

# Using -6 means "less than 6 days old — so modified on or after
now - 6 * 86400

# Using +6 means "more than 6 days old — so modified on or before
now - 7 * 86400 # (where the 7 is a little unexpected, perhaps).

```

## Reference

[Optimizing SSH Key Management on Linux Servers](https://medium.com/@eren.c.uysal/optimizing-ssh-key-management-on-linux-servers-6a60949486fb#bypass)
