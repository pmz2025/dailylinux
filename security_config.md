# Password complexity and Account Securities


You need to know the right files in the Fedora to 
configure 

- password length
- password complexities
- account lockout settings

## /etc/login.defs
The password minimum and maximum length
is available in /etc/login.defs


##  /etc/security/faillock.conf

In Fedora you can find a faillock.conf file
to configure account lockout and duration

deny = 5 # account is locked out after 5 attempts
unlock_time = 600 # default 10 minutes, account will remain locked


sed -i 's/# deny = 3/deny = 5/g' faillock.conf

sed -i 's/# unlock_time = 600/unlock_time = 900/g' faillock.conf

## /etc/security/pwquality.conf

To configure password complexities, you need to edit

minlen but instead copy pwquality.conf file into pwquality.conf.d directory
and make changes

minlen = 12
lcredit = -1
ucredit = -1
ocredit = 1
minclass = 4
dictcheck = 1 # sudo dnf install cracklib-dicts -y
enforce_for_root
difok = 5 # 

you can find explaination of all these using the following command

`grep ^[^#] pwquality.conf -B 2`

Please note this file is modified and copied in this
git repo for future reference
