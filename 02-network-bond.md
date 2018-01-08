# Bond of NICs

- documentation
https://help.ubuntu.com/community/UbuntuBonding

- note
The IEEE 8xx active+active, didn't work, it halved network speed. Maybe it requires cisco routers config to accept it.

# install
sudo apt-get install ifenslave


# bonding config
- /etc/modules
bonding

- load onding module
sudo modprobe bonding

- chanve /etc/network/interfaces
see *files/network-interfaces-bondActiveBackup*


# check
cat /proc/net/bonding/bond0

# removing bond
