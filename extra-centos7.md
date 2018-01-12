# centos 7 diferencias

- no ipconfig
ip addr

- no update-grub
grub2-mkconfig -o /boot/grub2/grub.cfg

- no apt
yum

- no /etc/network/interfaces
/etc/sysconfig/network-scripts/
Documentacion: https://wiki.centos.org/FAQ/CentOS7



## ip static and vlan  (created with nmcli)
 
- cat ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
NM_CONTROLLED=yes
ONBOOT=yes
BOOTPROTO=none
IPADDR=10.61.154.88
NETMASK=255.255.255.0
GATEWAY=10.61.154.1
DNS1=8.8.8.8
 
- cat ifcfg-vlan24
VLAN=yes
TYPE=Vlan
PHYSDEV=eth0
VLAN_ID=24
REORDER_HDR=yes
GVRP=no
MVRP=no
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=vlan24
ONBOOT=yes
IPADDR=10.1.4.1
PREFIX=24
GATEWAY=10.1.4.1


- restart network
systemctl restart network