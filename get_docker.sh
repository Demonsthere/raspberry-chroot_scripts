#!/bin/bash
DOCKER_VER=1.10.3

echo '----> Pulling and installing docker'
wget https://downloads.hypriot.com/docker-hypriot_${DOCKER_VER}-1_armhf.deb
dpkg -i docker-hypriot_*.deb
rm docker-hypriot_*.deb

echo '----> Adding the user pi to docker group'
groupadd docker || true
gpasswd -a pi docker
