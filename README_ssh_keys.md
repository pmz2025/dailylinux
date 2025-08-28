# SSH Keys and its security

~/.ssh/authorized_keys is the home folder of the user on the server you want to log into.
That file will contain the SSH public key of authorized users.

## What is possible with ssh-keygen?

Find the finger prints

```shell
ssh-keygen -lf ~/.ssh/id_dposeidon_satorni.pub 
256 SHA256:w3rqhP23t+6NGWJ3eTNDDL8mEgt6gRf7XuRC2nUExwg dposeidon__satorni2025-05-09 (ED25519)
```

## What is possible with ssh-keyscan?

you want to populate all keys from remote hosts into your .ssh/knownhosts

ssh-keyscan -t fqdnOfTheHost|IPAddressOfTheHost >> $HOME/.ssh/known_hosts

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

find $HOME/.ssh/ -mtime +90 -exec echo "older than 90 days" {} \;

## Reference

[Optimizing SSH Key Management on Linux Servers](https://medium.com/@eren.c.uysal/optimizing-ssh-key-management-on-linux-servers-6a60949486fb#bypass)
