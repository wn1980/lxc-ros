#!/usr/bin/env bash

set -e

sudo apt install python3-setuptools python3-pip

cd ~

if [ ! -d ~/lxdui ]; then

    git clone https://github.com/AdaptiveScale/lxdui.git
    
    cd ~/lxdui
    
    sudo python3 setup.py install

fi

cd ~/lxdui

#sudo pip3 install itsdangerous==2.0.1

sudo lxdui start


