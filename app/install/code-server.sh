#!/usr/bin/env bash

set -e

if [ -z "$1" ]
  then
    echo "Please provide version"
    exit 0
else
    VERSION=$1
fi

if [ $(uname -m) == 'x86_64' ]
then
    ARCH=amd64
elif [ $(uname -m) == 'aarch64' ] 
then 
    ARCH=arm64
else
    echo 'not matched platform!'
    exit 0
fi

if type -P code-server
then 
    sudo apt purge -y code-server
fi

FILE=code-server_${VERSION}_${ARCH}.deb
wget https://github.com/cdr/code-server/releases/download/v${VERSION}/$FILE

sudo apt update && sudo apt -y upgrade
sudo apt install -y ./$FILE
sudo apt-get autoremove -y 
sudo apt-get clean 
sudo rm -rf /var/lib/apt/lists/*
rm -f $FILE


cat > "/app/conf.d/code-server.conf" <<EOF
[program:code-server]
command=code-server --bind-addr 0.0.0.0:8008 --cert --auth none 
user=ubuntu
autorestart=true
stdout_logfile=/app/logs/code-server.log
redirect_stderr=true
#autostart=true
#stopwaitsecs=30
#stdout_logfile=/dev/stdout
#stdout_logfile_maxbytes=0
#stderr_logfile=/dev/stderr
#stderr_logfile_maxbytes=0

EOF
