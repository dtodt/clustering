#!/bin/bash

# second try

# 1
# 1.1. create the user on first machine
infinit user create --push --name infinit0 --fullname "Infinit0"
# 1.2. create the user on second machine
infinit user create --push --name infinit1 --fullname "Infinit1"
# 1.3. create the user on third machine
infinit user create --push --name infinit2 --fullname "Infinit2"

# 2
# 2.1. on first machine fetch the other machine users
infinit user fetch --as infinit0 --name infinit1
infinit user fetch --as infinit0 --name infinit2
# 2.2. on second machine fetch the other machine users
infinit user fetch --as infinit1 --name infinit0
infinit user fetch --as infinit1 --name infinit2
# 2.3. on third machine fetch the other machine users
infinit user fetch --as infinit2 --name infinit0
infinit user fetch --as infinit2 --name infinit1

# 4
# 4.1. on first machine create the silo
infinit silo create --filesystem --capacity 5GB --name local
# 4.2. on second machine create the silo
infinit silo create --filesystem --capacity 5GB --name local
# 4.3. on third machine create the silo
infinit silo create --filesystem --capacity 5GB --name local

# 5
# 5.1. on first machine create the network
infinit network create --as infinit0 --storage local --replication-factor 3 --name cluster --push
# 5.2. on first machine create passports to other machine users
infinit passport create --as infinit0 --network cluster --user infinit1 --push
infinit passport create --as infinit0 --network cluster --user infinit2 --push
# 5.3. on second machine fetch the passport, network and make a link
infinit passport fetch --as infinit1
infinit network fetch --as infinit1
infinit network link --as infinit1 --name infinit0/cluster --storage local
# 5.4. on second machine fetch the passport, network and make a link
infinit passport fetch --as infinit2
infinit network fetch --as infinit2
infinit network link --as infinit2 --name infinit0/cluster --storage local

# 6
# 6.1. on first machine create the volume
infinit volume create --as infinit0 --network cluster --name shared --push
# 6.2. on second machine fetch the volume
infinit volume fetch --as infinit1
# 6.3. on second machine fetch the volume
infinit volume fetch --as infinit2

# 7
# 7.1. on first machine mount the volume
infinit volume mount --as infinit0 --name shared --cache --publish --mountpoint mnt/shared/
# 7.2. on second machine mount the volume
infinit volume mount --as infinit1 --name infinit0/shared --cache --publish --mountpoint mnt/shared/
# 7.3. on third machine mount the volume
infinit volume mount --as infinit2 --name infinit0/shared --cache --publish --mountpoint mnt/shared/
