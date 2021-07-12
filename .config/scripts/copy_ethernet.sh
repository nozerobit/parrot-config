#!/bin/sh

# Copy Ethernet IP
ether=$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')
echo -n "$ether" | xclip -sel clipboard
