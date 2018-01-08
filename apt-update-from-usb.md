# use apt-get install from installation usb offline

- backup sources.list
mv /etc/apt/sources.list /etc/sources.list.web

- create new sourcs with just this one line
copy **files/etc-apt-sources.list.usb** in /etc/apt/sources.list

- mount usb ubuntu installer
mount /dev/sdb1 /mnt

apt update

apt install whatever
