# Clonezilla


# Simply clone
```
apt install clonezilla partclone
```

# Fix sfdisk -- R invalid option

Changing the calls from `sfdisk -R` to `blockdev --rereadpt` in the following
files solves the issue.

        /usr/sbin/ocs-makeboot
        /usr/sbin/ocs-onthefly
        /usr/share/drbl/sbin/ocs-functions


# Alternativa con dd
Para USB 3.0 o pequeños, si no se eterniza
```
dd if=/dev/urandom of=/dev/null status=progress
```


# Clonezilla server

https://drbl.org/installation/01-prepare-server.php

Follow install instrucions to get to apt install drbl
and then do the initial config with:

- drblsrv -i
- drblpush -i

Normal use

- /usr/sbin/dcs

Interesting video: https://www.youtube.com/watch?v=1huczzBKSrM
