# lxc-ros
## Set up LXD/LXC
```
$ sudo apt install snapd #if have not installed it yet
$ sudo snap install lxd
$ sudo adduser $USER lxd
$ newgrp lxd
$ sudo lxd init
```

## Setup fresh container
```
$ lxc launch ubuntu:20.04 ros1
$ lxc info ros1 --show-log
$ lxc file push -r app ros1/
```

## ROS+GUI profile
Create and add profile:
```
$ lxc profile create ports
$ lxc profile edit ports < profiles/ports.yml
$ lxc profile show ports
$ lxc profile add ros1 ports
$ lxc restart ros1
```

## Setup supervisord
```
$ lxc exec ros1 bash
$ /app/install/supervisor.sh
$ systemctl status supervisord.service
```

## Install web terminal (tmux)
```
$ lxc exec ros1 bash
$ /app/install/ttyd.sh
$ exit
$ lxc restart ros1
```
To access web terminal (tmux), type this url in web browser:
```
http://localhost:1000
```
Next, you can install more programs using scripts in /app/install folder.

## Ubuntu 22.04 (probe Windows)
```
$ sudo echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
$ sudo update-grub
```

## No IPv4
```
$ lxc exec lxc1 bash
$ dhclient -v eth0
```

## Resource Limits
```
$ lxc config set ros1 limits.memory 4GB
$ lxc config set ros1 limits.cpu 4
```
