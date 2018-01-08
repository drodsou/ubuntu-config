# fix grub of second hard drive

fdisk -l

mount /dev/sdb1 /mnt/
mount -t proc none /mnt/proc
mount -o bind /dev /mnt/dev
mount -t sysfs sys /mnt/sys

chroot /mnt/ /bin/bash
update-grub
/usr/sbin/grub-install --recheck --no-floppy /dev/sdb
exit

sync
reboot