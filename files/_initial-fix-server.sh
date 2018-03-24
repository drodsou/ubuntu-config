#!/bin/bash


# check sudo
if [ "$EUID" -e 0 ]
  then echo "Don't run with sudo"
  exit
fi

# common config
sudo mkdir /usr/share/config-common
sudo cp ./bashrc-common.sh /usr/share/config-common/
sudo cp ./vimrc-common.vim /usr/share/config-common/
#sudo cp ./conqueterm.vmb /usr/share/config-common/
#sudo cp /usr/share/X11/xkb/symbols/es /usr/share/X11/xkb/symbols/es.ori
#sudo cp ./usr-share-X11-xkb-symbols-es /usr/share/X11/xkb/symbols/es
#sudo dpkg-reconfigure keyboard-configuration

echo "source /usr/share/config-common/vimrc-common.vim" > ~/.vimrc
echo "source /usr/share/config-common/vimrc-common.vim" | sudo tee /root/.vimrc
echo "source /usr/share/config-common/bashrc-common.sh" > ~/.bashrc
echo "source /usr/share/config-common/bashrc-common.sh" | sudo tee /root/.bashrc

# install conqueterm for vim, use vith `vimbash file`
#vim /usr/share/config-common/conqueterm.vmb -c ':so % | q'
