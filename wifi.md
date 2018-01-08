
# install wifi ubuntu 16.04

- install
apt install wpasupplicant wireless-tools

- see networks
iw dev wlan0 scan | grep SSID
iwconfig

- config files
see **files/etc-network-interfaces.basic**
and **files/etc-wpa_supplicant-wpa_supplicant.conf**