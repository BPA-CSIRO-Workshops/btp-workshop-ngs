#!/bin/bash

# Install VirtualBox Guest Additions
apt-get install -y dkms
mkdir /mnt/iso
mount -o loop /home/ubuntu/VBoxGuestAdditions.iso /mnt/iso
/mnt/iso/VBoxLinuxAdditions.run

# Cleanup
umount /mnt/iso
rm -rf /mnt/iso
rm -rf /home/ubuntu/VBoxGuestAdditions.iso

# Reboot
reboot
sleep 60
