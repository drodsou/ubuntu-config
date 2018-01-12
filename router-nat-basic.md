# basic nat router

Change vlan* by privante subnet nics


```bash
# -- clear
iptables -F
iptables -t raw -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -Z
 
echo 0 > /proc/sys/net/ipv4/ip_forward
 
# -- start
echo 1 > /proc/sys/net/ipv4/ip_forward

IP_ROUTER=`hostname -I | awk '{ print $1 }'`
echo "IP_ROUTER $IP_ROUTER"

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $IP_ROUTER    # faster than MASQUERADE way

iptables -A FORWARD -i eth0 -o vlan* -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i vlan* -o eth0 -j ACCEPT
```