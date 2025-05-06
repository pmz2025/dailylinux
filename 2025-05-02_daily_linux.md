# Daily learnings

Disable lid close behavior in Fedora 42

sudo mkdir -pv /usr/lib/systemd/logind.conf.d
sudo cp /usr/lib/systemd/logind.conf /usr/lib/systemd/logind.conf.d
sudo vim /usr/lib/systemd/logind.conf.d/logind.conf

change #HandleLidSwitch=suspend to HandleLidSwitch=ignore

## Reference
[Disable lid close behavior in Fedora 42](https://discussion.fedoraproject.org/t/prevent-suspend-when-lid-close-in-fedora-40/114278)

### Journalctl

Keep you journalctl logs to minimum

`journalctl --unit pcscd -S today -p err`

#### Test your HAPROXY config

haproxy -f /path/to/haproxy.cfg -c

#### How to enable CRC on remote machine
https://www.linkedin.com/pulse/install-crc-openshift-remote-server-access-from-all-perell%C3%B3-covas/


#### Disable Suspend

`sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`