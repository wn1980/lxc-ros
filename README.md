# lxc-ros
## setup
```
$ lxc launch ubuntu:20.04 focal
$ lxc file push -r app focal/
$ lxc exec focal bash
$ /app/install/setup.sh
```
## ROS+GUI profile
```
$ lxc profile create ros
$ lxc profile edit ros
```
Fill this into the file

```
config:
  environment.DISPLAY: :0
  raw.idmap: both 1000 1000
  user.user-data: |
    #cloud-config
    runcmd:
      - "apt-key adv --fetch-keys 'https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc'"
      - "apt-add-repository 'http://packages.ros.org/ros/ubuntu'"
      - "apt-add-repository 'http://packages.ros.org/ros2/ubuntu'"
description: ROS
devices:
  X0:
    path: /tmp/.X11-unix/X0
    source: /tmp/.X11-unix/X0
    type: disk
name: ros
```
Add profile to container
```
$ lxc profile add focal ros
$ lxc restart focal
```