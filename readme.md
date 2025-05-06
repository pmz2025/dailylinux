# Daily Linux

Starting today 23.04.2025

What I learnt today and how and where i can use it?

## lslogins - display information about known users in the system

### Displaying detailed information about a single account

```bash
lslogins $(whoami)

lslogins --login=0,500
```
#### Using --output for custom display

```bash
lslogins --login=0,1000 --output=UID,USER,GECOS
```

#### Display password expiry and supplementary

```bash
⇒  lslogins -a -u -G
 UID USER     PWD-WARN PWD-MIN PWD-MAX PWD-CHANGE PWD-EXPIR  GID GROUP    SUPP-GIDS SUPP-GROUPS
   0 root                                                      0 root
1000 poseidon                                               1000 poseidon 987,10    libvirt,wheel
```

#### Last login

```bash
⇒  lslogins -L -u -p
 UID USER     LAST-TTY LAST-HOSTNAME LAST-LOGIN PWD-EMPTY PWD-LOCK PWD-DENY NOLOGIN HUSHED PWD-METHOD
   0 root                                                                         0
1000 poseidon tty2     tty2               10:25                                   0      0
```

### Get rid of double quotes

Sometimes we take output from the command in variable but it comes as text with quote as shown below
```bash
oc image info registry.redhat.io/rhel9/httpd-24:9.5-1740962963 --filter-by-os linux/amd64 -o json | jq .digest
"sha256:f97c915312cdaa8f4000d409e71ead6e4aaeaed587563560e44e93532273e063"
```
##### How to fix this problem

```bash
oc image info registry.redhat.io/rhel9/httpd-24:9.5-1740962963 --filter-by-os linux/amd64 -o json | jq .digest | tr -d '""'
sha256:f97c915312cdaa8f4000d409e71ead6e4aaeaed587563560e44e93532273e063

# xargs

oc image info registry.redhat.io/rhel9/httpd-24:9.5-1740962963 --filter-by-os linux/amd64 -o json | jq .digest | tr -d '""' | xargs -i sh -c 'IMGID="{}"; echo "$IMGID"'

# you do not need tr -d, when using with xargs, because by default xargs removes the quote
⇒  oc image info registry.redhat.io/rhel9/httpd-24:9.5-1740962963 --filter-by-os linux/amd64 -o json | jq .digest | xargs -i sh -c 'IMGID="{}"; echo "$IMGID"' 
sha256:f97c915312cdaa8f4000d409e71ead6e4aaeaed587563560e44e93532273e063

```


## References

