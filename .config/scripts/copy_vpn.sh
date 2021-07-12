#!/bin/sh

# Copy VPN IP
vpn=$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')
echo -n "$vpn" | xclip -sel clipboard
