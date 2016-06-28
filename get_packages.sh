#!/bin/bash
echo '----> System update'
apt-get update
apt-get install openssh-server htop rsync ansible
