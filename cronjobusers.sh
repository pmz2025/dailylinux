# need to run using sudo
#!/bin/bash
for user in $(cut -d: -f1 /etc/passwd); do
	crontab -l -u $user
done
