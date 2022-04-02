#!/usr/bin/env bash

set -e

#define ROS distro
export ROS_DISTRO=galactic

sudo apt update && sudo apt install -y \
    locales \
    curl \
    gnupg \
    lsb-release

sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update

sudo apt install -y ros-${ROS_DISTRO}-ros-core

sudo apt install -y \
    python3-rosdep \
    python3-colcon-common-extensions

sudo rm -f /etc/ros/rosdep/sources.list.d/20-default.list

sudo rosdep init
sudo rosdep fix-permissions && rosdep update

echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

sudo apt autoremove -y 
sudo apt-get clean
