
# sin probar

https://www.linuxquestions.org/questions/slackware-14/setting-up-network-bonding-eth0-wlan0-with-a-recent-kernel-how-4175562859/

```
#!/bin/sh
#
# Startup script setting up Wlan0 as fall-over in case eth1 drops out.
case "$1" in
  'start')
    echo "start bond0"
    # For standard eth + wlan combination
    # modprobe bonding fail_over_mac=active mode=active-backup miimon=100 primary=eth1
    
    # powerlan; recommended by braindump.bun.ch/Linux/Channel_Bonding 
    # checks that there is an actual connection to the router, not just to the powerline connector
    modprobe bonding fail_over_mac=active mode=active-backup arp_interval=100 arp_ip_target=192.168.1.254 primary=eth1

    # bring up bonded network
    ifconfig bond0 up
    echo +eth1 > /sys/class/net/bond0/bonding/slaves
    echo +wlan0 > /sys/class/net/bond0/bonding/slaves

    # connect wireless, but leave running process untouched
    WPAPID=$(echo $(ps axww | grep wpa_supplicant | grep -i wlan0 ) | cut -f1 -d' ')
    if [ ${WPAPID} ]; then
      echo "wpa_supplicant found running already"
    else
      echo "starting wpa_supplicant"
      wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlan0
    fi
    
    # todo: check exit status as wlan activation might need time to settle?
    dhcpcd -t 10 -r 192.168.1.90 bond0
  ;;
  'stop')
    ifconfig bond0 down
    rmmod bonding
  ;;
  *)
    echo "Usage: $0 {start|stop}"
  ;;
esac
```