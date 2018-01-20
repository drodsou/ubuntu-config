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
sudo apt update
sudo apt -y exfat-fuse exfat-utils
 
# common config
sudo mkdir /usr/share/config-common
sudo cp ./dotnanorc /usr/share/config-common/
sudo cp ./usr-share-nano-markdown.nanorc /usr/share/nano/markdown.nanorc
sudo cp ./bashrc-common.sh /usr/share/config-common/
sudo cp /usr/share/X11/xkb/symbols/es /usr/share/X11/xkb/symbols/es.ori
sudo cp ./usr-share-X11-xkb-symbols-es /usr/share/X11/xkb/symbols/es
sudo dpkg-reconfigure keyboard-configuration
 
ln -s /usr/share/config-common/dotnanorc ~/.nanorc
sudo ln -s /usr/share/config-common/dotnanorc /root/.nanorc
echo "source /usr/share/config-common/bashrc-common.sh" > ~/.bashrc
sudo cp /home/$SUDO_USER/.bashrc /root/
