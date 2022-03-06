#!/usr/bin/env bash

set -e

apt-get update && apt-get upgrade -y
apt-get install -y \
  apt-transport-https \
  build-essential \
  curl \
  python-is-python3 \
  python3-dev 

# update pip
curl https://bootstrap.pypa.io/get-pip.py | python -

pip install -U --no-cache-dir \
  supervisor \
  supervisor_twiddler

cat > "/etc/systemd/system/supervisord.service" <<EOF
[Unit]
After=network.service

[Service]
ExecStart=/usr/local/bin/supervisord -c /app/supervisord.conf
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=default.target

EOF

systemctl daemon-reload

systemctl enable supervisord.service

systemctl start supervisord.service
