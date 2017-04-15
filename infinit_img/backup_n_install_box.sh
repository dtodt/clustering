#!/bin/bash

# stop all vms
vagrant halt
# make box backup
vagrant package default --output infinit.box
# remove old box files
rm -rf ~/.vagrant.d/boxes/infinit/
# restore backup box
vagrant box add infinit infinit.box
# remove default machine
vagrant destroy -f
# remove box backup
rm -rf infinit.box