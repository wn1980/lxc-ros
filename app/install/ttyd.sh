#!/usr/bin/env bash

set -e

apt-get update && apt-get upgrade -y
apt-get install -y \
  build-essential \
  cmake \
  git \
  libjson-c-dev \
  libwebsockets-dev \
  tmux

cd ~
rm -rf ~/ttyd
git clone https://github.com/tsl0922/ttyd.git
cd ttyd && mkdir build && cd build
cmake ..
make && make install
rm -rf ~/ttyd

cat > "/etc/systemd/system/ttyd.service" <<EOF
[Unit]
After=network.service

[Service]
ExecStart=/usr/local/bin/ttyd -p 1000 -u 1000 -w /home/ubuntu tmux
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=default.target

EOF

systemctl daemon-reload

systemctl enable ttyd.service

systemctl start ttyd.service
