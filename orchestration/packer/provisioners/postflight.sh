#!/bin/bash

# Postflight
apt-get update
apt-get install -y ubuntu-desktop
apt-get install -y lightdm
apt-get install -y gnome-session-fallback
/usr/lib/lightdm/lightdm-set-defaults -s gnome-classic
/usr/lib/lightdm/lightdm-set-defaults -l false
/bin/sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Disable LTS Upgrade Notification
sed -i 's/Prompt=lts/Prompt=never/g' /etc/update-manager/release-upgrades
