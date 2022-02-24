#!/usr/bin/env bash

set -e

############# DON'T REMOVE ############
source /opt/ros/$ROS_DISTRO/setup.bash
source ~/catkin_ws/devel/setup.bash
#######################################

#roslaunch --wait turtlebot_bringup minimal.launch &

#roslaunch --wait turtlebot_bringup 3dsensor.launch &

#roslaunch --wait turtlebot_laser bringup.launch &

###### DON'T REMOVE ######
# run forever
tail -f /dev/null
