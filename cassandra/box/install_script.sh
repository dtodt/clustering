#!/bin/bash

# setup datastax repository
echo "deb https://${DSE_LOGIN}:${DSE_PASS}@debian.datastax.com/enterprise stable main" | tee -a /etc/apt/sources.list.d/datastax.sources.list
curl -L https://debian.datastax.com/debian/repo_key | apt-key add -

apt-get update -y

# install java
# add-apt-repository ppa:syseleven-platform/xenial-ports
apt install -y openjdk-8-jre-headless # python-support python-imaging python-pip dsc30

echo "Vagrant provisioning complete"