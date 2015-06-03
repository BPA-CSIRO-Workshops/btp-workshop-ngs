#!/bin/bash

tools_location='https://swift.rc.nectar.org.au:8888/v1/AUTH_809/Tools'

# Amazon EC2 AMI Tool
apt-get update
apt-get install unzip -y
apt-get install ruby -y
apt-get install kpartx -y
cd /tmp/
wget -4 --no-check-certificate $tools_location/ec2-ami-tools-1.5.6.zip
mkdir /usr/local/ec2
unzip ec2-ami-tools-1.5.6.zip -d /usr/local/ec2
mv /usr/local/ec2/ec2-ami-tools-1.5.6 /usr/local/ec2/ec2-ami-tools
export PATH=$PATH:/usr/local/ec2/ec2-ami-tools/bin
