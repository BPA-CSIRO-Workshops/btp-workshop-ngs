#!/bin/bash

#############
## Prepare ##
#############
apt-get update
# Prefer IPv4 over IPv6
echo "precedence ::ffff:0:0/96 100" >> /etc/gai.conf
####################
