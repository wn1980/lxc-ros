#!/usr/bin/env bash

set -e

#lxc delete ros -f
#lxc profile delete ports

lxc launch ubuntu:20.04 ros
lxc file push -r app ros/

lxc profile create ports
lxc profile edit ports < profiles/ports.yml
lxc profile add ros ports

lxc restart ros

lxc exec ros bash /app/install/supervisor.sh
lxc exec ros bash /app/install/ttyd.sh
lxc exec ros bash /app/install/app-chown.sh
