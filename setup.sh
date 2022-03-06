#!/usr/bin/env bash

set -e

#lxc delete ros1 -f
lxc launch ubuntu:20.04 ros1
lxc file push -r app ros1/

lxc profile delete ros
lxc profile create ros
lxc profile edit ros < profile.yml
lxc profile add ros1 ros

lxc exec ros1 bash /app/install/supervisor.sh
lxc exec ros1 bash /app/install/ttyd.sh
lxc exec ros1 bash /app/install/app-chown.sh

lxc restart ros1
