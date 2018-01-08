

## virt-manager
Nota: Virtualbox da problemas de velocidad con cernunnos (router nat) como guest, da igual el tipo de tarjeta o configuración que intentes. ClearOS probado y le pasaba lo mismo. Con KVM va bien a la primera.

- Instalar
apt install qemu-kvm libvirt-bin virt-manager gksudo

- Eliminar red que crea por defecto
virsh net-list
virsh net-destroy default
virsh net-undefine default
service libvirtd restart
ifconfig

- Acceso directo
gksudo /usr/bin/virt-manager

- comandos
virsh list --all 
virsh start <maquina>
virsh shutdown <maquina>
virsh autostart <maquina>   // para que arranque en boot


# el