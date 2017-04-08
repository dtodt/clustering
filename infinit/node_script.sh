#!/bin/bash

# set timezone
echo "#{CFG_TZ}" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata

# install base packages
apt-get update -y
apt-get install -y fuse
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3D2C3B0B
add-apt-repository "deb https://debian.infinit.sh/ trusty main"
apt-get update -y
apt-get install -y infinit

# add infinit to execution path
echo "export PATH=/opt/infinit/bin/:$PATH"

# creates a new user
# infinit-user --signup --name john --fullname "John Doe"

# setup the network
# infinit-network --create --as john --storage local --name cassandra --push

# creates the volume
# nfinit-volume --create --as john --network cassandra --name my-volume --push

# mount the volume
# infinit-volume --mount --as john --name my-volume --mountpoint ~/mnt --allow-root-creation --cache --publish --daemon

echo "Vagrant provisioning complete"