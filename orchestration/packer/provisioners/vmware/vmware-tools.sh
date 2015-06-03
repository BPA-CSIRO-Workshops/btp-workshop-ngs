#!/bin/bash

# Install VMWare Tools
apt-get install -y dkms
mkdir /mnt/iso
mount -o loop /home/ubuntu/linux.iso /mnt/iso
cd /tmp
tar xvzf /mnt/iso/VMwareTools*.tar.gz
/tmp/vmware-tools-distrib/vmware-install.pl default

# Cleanup
umount /mnt/iso
rm -rf /mnt/iso
rm -rf /tmp/vmware-tools-distrib

# Reboot
reboot
sleep 60
