
# Chosing distro
Ubuntu 16.04 Server
(17.10 still too new)


## ubuntu server installation

- raid?
Sin raid software pq clonezilla no lo clona pare ser.
Eliminamos una variable de complejidad, suplida con buenos backups y servidor de respaldo ready-to-go

- lvm?
Metal servers : van sin lvm
Virtuales : llevan lvm, para backuper mysql on the fly
Aunque podrian llevar todos lvm, viene bien para probar cosas y hacer rollback, pero bueno, hay que acordarse de borrar los snapshots y eso, así es una variable menos. 
Ademas sin comprobar si clonezilla clona bien lvm

- desconectar red para que vaya mas rapido
- openssh, mail (post fix : satelite, smtp2...)
- virtualizacion : no, crea bridges que no se necesitan


## get network
- apt purge network-manager 
- ip link
- vi /etc/network/interfaces


## git clone this 
`git clone https://github.com/drodsou/ubuntu-post-config.git`


## post install
- sudo su -
- apt purge brtfs-tools
- vi /etc/network/interfaces 
- vi /etc/dhcp/dhclient.conf
timeout=7

- vi /etc/default/grub
GRUB_TIMEOUT=1
# if you want to change it in /boot/grub/grubenv
#GRUB_DEFAULT=saved   
# if you what to force nic to be named eth0
#GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"

update-grub

# reboot
- you should have network
- ssh from desktop computer for easier copy paste rest of configuration



- copy things
mkdir /usr/share/config-common
cp *comun* /usr/share/config-common

- in .bashrc, source
. /usr/share/config-common/bashrc-comun.sh

- in .vimrc, source
source /usr/share/config-common/vimrc-comun.vim

- apt update
- apt upgrade
- apt autoremove


# ended server install
CLONAR aqui como base

## who to fix things
:puerta de atrás, entrar como root, a prueba de fallos)
- Enter maintenance mode: 
press "e" in grub an add 1 at the end of "linux ...kernel .."
- nics: 
ip link










