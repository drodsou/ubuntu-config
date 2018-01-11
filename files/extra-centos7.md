# centos 7 diferencias

- no ipconfig
ip addr

- no update-grub
grub2-mkconfig -o /boot/grub2/grub.cfg

- no apt
yum

- no /etc/network/interfaces
Documentacion: https://wiki.centos.org/FAQ/CentOS7

/etc/sysconfig/network-scripts/ifcfg-eth0
```
DEVICE=eth0
TYPE=Ethernet
NM_CONTROLLED=no
ONBOOT=yes
BOOTPROTO=none   # dhcp
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1  # also in /etc/sysconfig/network
DNS1=8.8.8.8    # also in /etc/resolv.conf with "nameserver"
```


systemctl restart network