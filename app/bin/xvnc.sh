#!/usr/bin/env bash

set -e

rm -f /tmp/.X0-lock

Xvnc :0 -depth 24 -ac -pn -rfbport=5901 -SecurityTypes=None -desktop=RobotOps
