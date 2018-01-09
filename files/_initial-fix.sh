#!/bin/bash


# check sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

# grub and default network names
sudo cp ./etc-default-grub /etc/default/grub
sudo update-grub

# pre-install
sudo cp ./etc-apt-sources.list* /etc/apt/
sudo apt update
sudo apt -y install zip unzip exfat-fuse exfat-tools

# fix kvm net and set bonded/bridged
sudo virsh net-list
sudo virsh net-destroy default
sudo virsh net-undefine default

# # bonding
# apt -y install ifenslave 
# echo "bonding" >> /etc/modules
# 
# # bridge
# apt -y install bridge-utils

#network config
sudo apt purge network-manager
sudo cp ./etc-network-interfaces.d/* /etc/network/interfaces.d/
sudo cp ./etc-network-interfaces /etc/network/interfaces
sudo sed -i 's/timeout 300/timeout 10/' /etc/dhcp/dhclient.conf


# common config
sudo mkdir /usr/share/config-common
sudo cp ./bashrc-common.sh /usr/share/config-common/
sudo cp ./vimrc-common.vim /usr/share/config-common/
sudo cp ./conqueterm.vmb /usr/share/config-common/
sudo cp /usr/share/X11/xkb/symbols/es /usr/share/X11/xkb/symbols/es.ori
sudo cp ./usr-share-X11-xkb-symbols-es /usr/share/X11/xkb/symbols/es
sudo dpkg-reconfigure keyboard-configuration

echo "source /usr/share/config-common/vimrc-common.vim" > ~/.vimrc
echo "source /usr/share/config-common/bashrc-common.sh" > ~/.bashrc

# install conqueterm for vim, use vith `vimbash file`
vim /usr/share/config-common/conqueterm.vmb -c ':so % | q'

# pre xfce config
sudo cp ./ubuntu-dark-wallpaper.jpg /usr/share/backgrounds/
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