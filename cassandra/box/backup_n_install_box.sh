#!/bin/bash

# stop all vms
vagrant halt
# make box backup
vagrant package default --output cassandra.box
# remove old box files
rm -rf ~/.vagrant.d/boxes/cassandra/
# restore backup box
vagrant box add cassandra cassandra.box
# remove default machine
vagrant destroy -f
# remove box backup
rm -rf cassandra.box