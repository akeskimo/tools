#!/bin/bash

# Initializes and launches new container image

if [ "$#" -ne 1 ]; then
    echo "arg1 ~ name-of-container-to-create"
fi

container_name=$1
image_name=debian/11

cat <<EOF | lxd init --preseed
config: {}
cluster: null
networks:
- config:
    ipv4.address: auto
    ipv6.address: auto
  description: ""
  managed: false
  name: lxdbr0
  type: ""
storage_pools:
- config:
    size: 46GB
  description: ""
  name: default
  driver: zfs
profiles:
- config: {}
  description: ""
  devices:
    eth0:
      name: eth0
      nictype: bridged
      parent: lxdbr0
      type: nic
    root:
      path: /
      pool: default
      type: disk
  name: default
EOF

lxc launch images:debian/11 $container_name

