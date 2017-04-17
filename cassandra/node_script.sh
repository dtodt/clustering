#!/bin/bash

apt-get install dse-full -y

# stop Cassandra (which automatically starts after install) and clear data files
# echo "Stopping Cassandra..."
# sleep 10
# service cassandra stop
# sleep 10
# rm -rf /var/lib/cassandra/*
# sleep 10

# copy config files and restart Cassandra
# IP=`/sbin/ifconfig enp0s8 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
# sed -i -e "s/^\s*cluster_name:.*$/cluster_name: 'Cluster Vagrant'/" /etc/cassandra/cassandra.yaml
# sed -i -e "s/ seeds:.*$/ seeds: 'node1,node2'/" /etc/cassandra/cassandra.yaml
# sed -i -e "s/^listen_address:.*$/listen_address: $IP/" /etc/cassandra/cassandra.yaml
# sed -i -e "s/^.*broadcast_address:.*$/broadcast_address: /" /etc/cassandra/cassandra.yaml
# sed -i -e "s/^rpc_address:.*$/rpc_address: 0.0.0.0/" /etc/cassandra/cassandra.yaml
# sed -i -e "s/^.*broadcast_rpc_address:.*$/broadcast_rpc_address: $IP/" /etc/cassandra/cassandra.yaml
# sed -i -e "s/^endpoint_snitch:.*$/endpoint_snitch: PropertyFileSnitch/" /etc/cassandra/cassandra.yaml

# echo "Restarting Cassandra..."
# service cassandra start

echo "Vagrant provisioning complete"