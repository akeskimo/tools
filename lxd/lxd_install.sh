#!/bin/bash

# Install and initialize lxd container as current user

lxc_config=$(pwd)/lxc.init.example.yaml

sudo apt install -y lxd zfsutils-linux
newgrp lxd
sudo adduser $(whoami) lxd

lxc init -c $lxc_config

