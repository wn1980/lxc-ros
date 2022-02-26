#!/usr/bin/env bash

set -e

#sed -i -e 's/http:\/\/archive/mirror:\/\/mirrors/' -e 's/http:\/\/security/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

# install Ubuntu packages
apt-get update && apt-get upgrade -y
apt-get install -y \
  apt-transport-https \
  build-essential \
  curl \
  git \
  wget \
  nano \
  bash-completion \
  htop \
  terminator \
  xfe \
  jwm \
  net-tools \
  iputils-ping \
  usbutils \
  man \
  tigervnc-standalone-server \
  tigervnc-xorg-extension \
  python-is-python3 \
  python3-dev \
  python3-pip \
  python3-numpy \
  python3-scipy

# update pip
curl https://bootstrap.pypa.io/get-pip.py | python -

echo "export HOME=/home/ubuntu" >> ~/.bashrc
