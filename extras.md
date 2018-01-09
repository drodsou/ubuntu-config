
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