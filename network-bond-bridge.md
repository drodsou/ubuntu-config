# Bond of NICs

- documentation
https://help.ubuntu.com/community/UbuntuBonding

- note
The IEEE 8xx active+active require router, just use mode 0 roundrobin, or 1 active-backup

- install
sudo apt-get install ifenslave

- bonding config: /etc/modules
bonding

- load bonding module
sudo modprobe bonding

- config network
see *files/etc-network-interfaces.d/static-bond-bridge*


- check
cat /proc/net/bonding/bond0

- removing bond
bond0 is by default
can remove others with ifenslave -d bond1 slave1 slave2

# Bridge
Only needed if you want to use nics bond in KVM, otherwise just use mavtap in kvm

- install
apt -y install bridge-utils

- network config
see *files/etc-network-interfaces.d/static-bond-bridge*
