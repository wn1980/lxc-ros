#!/usr/bin/env bash

set -e

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
