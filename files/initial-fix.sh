#!/bin/bash


# check sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# grub and default network names
cp ./etc-default-grub /etc/default/grub
update-grub

# pre-install
cp ./etc-apt-sources.list* /etc/apt/
apt update
apt -y install zip unzip exfat-fuse exfat-tools

# fix kvm net and set bonded/bridged
virsh net-list
virsh net-destroy default
virsh net-undefine default

# # bonding
# apt -y install ifenslave 
# echo "bonding" >> /etc/modules
# 
# # bridge
# apt -y install bridge-utils

#network config
apt purge network-manager
cp ./etc-network-interfaces.d/* /etc/network/interfaces.d/
cp ./etc-network-interfaces /etc/network/interfaces


# common config
mkdir /usr/share/config-common
cp ./bashrc-common.sh /usr/share/config-common/
cp ./vimrc-common.vim /usr/share/config-common/
cp ./conqueterm.vmb /usr/share/config-common/
cp /usr/share/X11/xkb/symbols/es /usr/share/X11/xkb/symbols/es.ori
cp ./usr-share-X11-xkb-symbols-es /usr/share/X11/xkb/symbols/es
dpkg-reconfigure keyboard-configuration

echo "source /usr/share/config-common/vimrc-common.vim" > ~/.vimrc
echo "source /usr/share/config-common/bashrc-common.sh" > ~/.bashrc

# install conqueterm for vim, use vith `vimbash file`
vim /usr/share/config-common/conqueterm.vmb -c ':so % | q'

# pre xfce config
cp ./ubuntu-dark-wallpaper.jpg /usr/share/backgrounds/
mkdir -p ~/.config/xfce4
unzip ./dotconfig-xfce4.zip -d ~/.config/xfce4/

cat <<EOF
Other sugestions:
- no btrfs: apt purge btrfs-tools
- wifi: apt install wpasupplicant wireless-tools
- if you need to apt install without LAN : see alternative sources.list.usb in /etc/apt
- NICs bonding:
    apt -y install ifenslave 
    echo "bonding" >> /etc/modules
 - Network bridge
    apt -y install bridge-utils

Now: Select network in /etc/network/interfaces and configures in /etc/network/interfaces.d
...and reboot
EOF