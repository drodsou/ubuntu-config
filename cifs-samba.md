# CIFS / SAMBA

# docs
https://help.ubuntu.com/community/MountWindowsSharesPermanently
https://wiki.ubuntu.com/MountWindowsSharesPermanently

# Mount windows share
- apt install cifs-utils
- mount -t cifs //server/share /mnt -o credentials /root/cifscreds 

# /etc/fstab


# Troubleshooting CIFS

https://wiki.samba.org/index.php/LinuxCIFS_troubleshooting

# credentials file

  user=myuser
  password=mypass
  domain=mydomain.local
