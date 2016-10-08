#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo '----> System update'

apt-get update
apt-get install -y openssh-server htop rsync
