# lxc-ros
## Setup fresh container
```
$ lxc launch ubuntu:20.04 ros1
$ lxc info ros1 --show-log
$ lxc file push -r app ros1/
```

## ROS+GUI profile
Create and add profile:
```
$ lxc profile create ros
$ lxc profile edit ros < profile.yml
$ lxc profile add ros1 ros
$ lxc restart ros1
```

## Setup supervisord
```
$ lxc exec ros1 bash
$ /app/install/supervisor.sh
$ exit
$ lxc restart ros1
```

## Install web terminal
```
$ lxc exec ros1 bash
$ /app/install/ttyd.sh
$ exit
$ lxc restart ros1
```
To access web terminal, type this url in web browser:
```
http://localhost:1000
```
Next, you can install more programs using scripts in /app/install folder.

## Ubuntu 22.04 (probe Windows)
```
$ sudo echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
$ sudo update-grub
```
