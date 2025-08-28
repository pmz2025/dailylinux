# sample script to play or
# do anything on hosts
#!/bin/bash
for server in $(cat inventory.txt);
do
	echo $server
	# ssh-copy-id -i $HOME/.ssh/deploy_ed25519.pub deploy@$host
done

# example here describes
# that user named deploy wish to copy
# .pub key to all hosts in
# in inventory.txt file
