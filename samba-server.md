# SAMBA SERVER

#### Doc
https://www.howtoforge.com/tutorial/samba-server-ubuntu-16-04/

#### installation: annonymous folder share for all

apt-get install -y samba samba-common python-glade2 system-config-samba

vi /etc/samba/smb.conf
```
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = ubuntu
security = user
map to guest = bad user
dns proxy = no

#============================ Share Definitions ============================== 

[public]
path = /samba/public
browsable =yes
writable = yes
guest ok = yes
read only = no
force user = nobody
```
   
mkdir -p /samba/public

chmod -R 0775 /samba/public

chown -R nobody:nogroup /samba/public

service smbd restart

