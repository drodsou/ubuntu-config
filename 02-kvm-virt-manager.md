# kvm / virt-manager
Nota: Virtualbox da problemas de velocidad con cernunnos (router nat) como guest, da igual el tipo de tarjeta o configuración que intentes. ClearOS probado y le pasaba lo mismo. Con KVM va bien a la primera.

- Instalar
`apt install qemu-kvm libvirt-bin virt-manager gksudo`

- Eliminar red que crea por defecto (ya hecho en initial-fix.sh)
```
virsh net-list
virsh net-destroy default
virsh net-undefine default
service libvirtd restart
ifconfig
```

- Acceso directo (permisos root)
*gksudo /usr/bin/virt-manager*

- comandos
```
virsh list --all 
virsh start <maquina>
virsh shutdown <maquina>
virsh autostart <maquina>   // para que arranque en boot
virsh list --autostart
```

- network

If two nics bonding you need to create a classic bridge, see

If only one nic, you dont need bridge just use mavtap option


# extra:mount virtual disk w/o virtual machine
```
modprobe nbd
qemu-nbd -c /dev/nbd0 ./somedisk.vmdk
mount -t ext4 /dev/nbd0p1 /mnt/disk1p1

# do things

umount /mnt/disk1p1
qemu-nbd -d /dev/nbd0
```
