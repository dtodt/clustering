#!/bin/bash

# set timezone
echo "#{CFG_TZ}" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata

#{deb_cache_cmds}

# configure repositories
add-apt-repository ppa:openjdk-r/ppa
add-apt-repository ppa:syseleven-platform/xenial-ports
curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.community.list

apt-get update
# install OpsCenter and a few base packages
apt-get install vim curl zip unzip git python-support python-imaging python-pip openjdk-8-jdk opscenter -y

# start OpsCenter
service opscenterd start

echo "Vagrant provisioning complete and OpsCenter started"