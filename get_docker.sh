#!/bin/bash
DOCKER_VER=1.10.3

echo '----> Pulling and installing docker'
wget https://downloads.hypriot.com/docker-hypriot_${DOCKER_VER}-1_armhf.deb
sudo dpkg -i docker-hypriot_*.deb

echo '----> Adding the user pi to docker group'
sudo groupadd docker || true
sudo gpasswd -a pi docker

echo '----> Restarting docker service'
sudo service docker restart
