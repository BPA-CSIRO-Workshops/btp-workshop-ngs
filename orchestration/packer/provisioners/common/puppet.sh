#!/bin/bash

############
## Puppet ##
############
cd /tmp/
ubuntu_version=`lsb_release -s -c`
wget -4 --no-check-certificate https://apt.puppetlabs.com/puppetlabs-release-$ubuntu_version.deb
dpkg -i /tmp/puppetlabs-release-$ubuntu_version.deb
apt-get update
apt-get install -y puppet
rm /tmp/puppetlabs-release-$ubuntu_version.deb
####################
