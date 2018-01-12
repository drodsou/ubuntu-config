# -- DESPUES DE CLONAR / AFTER CLONE

1) Cambiar hostname en varios sitios
sudo sed -i "s/OLD-HOSTNAME/NEW-HOSTNAME/g" /etc/hosts /etc/hostname /etc/postfix/main.cf

2) Cambiar IP
sudo sed -i "s/10.1.1.100/NEW-IP/g" /etc/network/interfaces

3) Reiniciar
sudo reboot

4) Crear ssh keys y renovar openssh keys
ssh-keygen -t rsa

sudo rm /etc/ssh/ssh_host_*
sudo /usr/sbin/dpkg-reconfigure openssh-server
sudo service ssh restart