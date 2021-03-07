#!/bin/sh
# chmod 755 staticip.sh
# ./staticip.sh

cat << EOF >> sudo /etc/network/interfaces
iface eth0 inet static
address 192.168.10.5
netmask 255.255.255.0
gateway 192.168.10.1
network	192.168.10.0
broadcast 192.168.10.255
test
EOF