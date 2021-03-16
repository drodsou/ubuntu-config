## migrate ubuntu 16 => 18 => 20

- sudo apt update
- sudo apt upgrade
- sudo apt autoremove --purge
- mi /etc/update-manager/release-upgrades  => `prompt=lts`
- sudo do-release-upgrade

## python

- sudo apt purge python2-minimal python2 python2-dev python-is-python2 python-dev-is-python2 python2.7 python2.7-dev python2.7-minimal
- sudo apt install python-is-python3

## network ifupdown => netplan

- systemctl stop networking
- systemctl disable networking
- systemctl stop resolvconf
- systemctl disable resolvconf
- systemctl enable systemd-networkd
- systemctl start systemd-networkd
- systemctl status systemd-networkd

- mi /etc/netplan/config.yaml
- sudo netplan apply

## if using dnsmasq

Ubuntu 20.04 uses systemd-resolve (port 53 conflict)

- sudo systemctl disable systemd-resolved
- sudo systemctl stop systemd-resolved

## no rc.local anymore, use systemd service

example for one time script: myscript.service
```
# -- myscript.service
# ln -s this file to /lib/systemd/system/myscript.service
# then: servicectl enable myscript
# then: servicectl start myscript

[Unit]
Description=Start myscript on boot

[Service]
ExecStart=/home/myuser/myscript

[Install]
WantedBy=multi-user.target
```

example for e.g. http service
```
# -- myserver.service
# ln -s this file to /lib/systemd/system/myserver.service
# then: servicectl enable myserver
# then: servicectl start myserver
# logs in /var/log/syslog or: journalctl -e -u myserver

[Unit]
Description=myserver server
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
Type=simple
Restart=always
RestartSec=5
User=myuser
ExecStart=/path/to/myserver
EnvironmentFile=/path/to/myserver.env
```
use `env` command to generate the .env file and remove unneeded things

## maybe: disable wait for network

Se arranca os servidor fisico e unha das tarxetas non ten rede espera 2 minutos, por ela. Pódese desactivar facendo isto:
To prevent server wait for phisical NIC on boot for 2 minuts in case one has no network

- sudo systemctl mask systemd-networkd-wait-online.service

