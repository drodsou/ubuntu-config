
# -- EXTRAS

## speedtest
- python-pip
- pip install speedtest-cli


# vim conque shell

- install
wget -O conqueterm.vmb http://www.vim.org/scripts/download_script.php?src_id=16279

or get it from *files/conqueterm.vmb*

vim conqueterm.vmb -c ':so % | q'

- use
:ConqueTermSplit bash

- change window vim (can copy pasta with "visual")
control-w w   // when NOT in insert mode

- alias
vimbash  // defined in files/bashrc-common.sh


# pendrives grandes
apt install exfat-fuse exfat-tools

#speedtest-cli
apt install python-pip
pip install --upgrade pip
pip install speedtest-cli
speedtest


# format ntfs partition
- easy way with gparted
sudo apt-get install ntfsprogs gparted
use gparted in X

- with fdisk + mkfs.ntfs
sudo fdisk /dev/sdX
n ... // new partition
t 7   // change partition type 7 = hpfs/ntfs/exfat
w

sudo mkfs.ntfs -f /dev/sdXy  // quick NTFS format


# boot iso from grub2

- grml like ubuntu isos
apt install grml-rescueboot
cp whatever.iso /boot/gmrl
update-grub

- 


- unetbooting



- manually
/etc/grub.d/40_custom
```
# insmod ntfs
# insmod iso9660

menuentry "Menu entry for ISO" {
        # set iso here
        set isofile="/home/<username>/Downloads/<someiso>.iso"
        # set partition here, /dev/sda1 = (hd0,1)
        loopback loop (hd0,1)$isofile
        linux (loop)/casper/vmlinuz boot=casper iso-scan/filename=$isofile noprompt noeject
        initrd (loop)/casper/initrd.lz
 }
```