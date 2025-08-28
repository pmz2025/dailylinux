# Security Settings in Faillock

Set deny = 5 so that after 5 failed attempt, account is locked.

sed 's/# deny = 3/deny = 5/g' faillock.conf

Set unlock_time = 600, 600 seconds is equal 10 minutes,
account will be locked out, this value is default.
so no need to change, in case you wish the unlock_time

sed 's/# unlock_time = 600/unlock_time = 900/g' faillock.conf
