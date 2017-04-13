#!/bin/bash

# set timezone
echo "#{CFG_TZ}" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata

# install base packages
apt-get update -y
apt-get install -y fuse
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3D2C3B0B
apt-get install -y software-properties-common apt-transport-https
add-apt-repository "deb https://debian.infinit.sh/ trusty main"
apt-get update -y
apt-get install -y infinit

# add infinit to execution path
echo "export PATH=/opt/infinit/bin:$PATH" >> /etc/profile
echo ". /etc/profile"


# TODO create a common script

echo "Vagrant provisioning complete"