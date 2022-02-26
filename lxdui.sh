#!/usr/bin/env bash

set -e

cd ~

if [ ! -d ~/lxdui ]; then

    git clone https://github.com/AdaptiveScale/lxdui.git
    
    cd ~/lxdui
    
    sudo python3 setup.py install

fi

cd ~/lxdui

sudo lxdui start
