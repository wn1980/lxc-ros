#!/usr/bin/env bash

set -e

#sed -i -e 's/http:\/\/archive/mirror:\/\/mirrors/' -e 's/http:\/\/security/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list
#sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

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
  python3-numpy \
  python3-scipy

cat > "/app/conf.d/vnc.conf" <<EOF
[program:xvnc]
command=/app/bin/xvnc.sh
autorestart=true
stdout_logfile=/app/logs/xvnc.log
redirect_stderr=true

[program:xsession]
command=jwm -display :9 -f /app/system.jwmrc
user=ubuntu
autorestart=true
stdout_logfile=/app/logs/xsession.log
redirect_stderr=true

EOF
