#!/bin/bash
# Delete any previous rules in the INPUT, FORWARD and OUTPUT tables
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

#Enable ssh only from computers in the range 130.15.0.0 to 130.15.255.255 [netmask /16]                            
sudo iptables -A INPUT -p TCP --sport 22 -s 130.15.0.0/16 -j ACCEPT 

#Enable ssh from computers in any private network
iptables -A INPUT -p TCP --sport 22 -s 192.168.0.0/16 -j ACCEPT
iptables -A INPUT -p TCP --sport 22 -s 172.0.0.0/8 -j ACCEPT
iptables -A INPUT -p TCP --sport 22 -s 10.0.0.0/8 -j ACCEPT

# Enable http and https from any IP
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 443 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 80 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 443 -j ACCEPT

#Drop any other incoming tcp traffic
iptables -A INPUT -p TCP -j DROP

#Block connecting from your computer to any IP outside the range 130.15.0.0 to 130.15.255.255 [netmask /16]
iptables -A OUTPUT -p TCP -s 130.15.0.0/16 -j ACCEPT

# Only allow IP 130.15.100.100 to connect to your mysql running on port 3306
iptables -A INPUT -p TCP -s 130.15.100.100 --dport 3306 -j ACCEPT
iptables -A OUTPUT -p TCP -s 130.15.100.100 --dport 3306 -j ACCEPT

#Drop outgoing ssh traffic to all other computers 
iptables -A INPUT -p TCP --dport 22 -j DROP

#Can youu still ssh the VM from your host machine? Why? If you cant, how to fix it?
echo "No not possible to ssh the vm from host machine unless port forwarding is used"
