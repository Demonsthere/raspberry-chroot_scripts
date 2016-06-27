#!/bin/bash -x
echo '----> create ssh dir'
mkdir -p /home/pi/.ssh
echo '----> crete ssh config file'
cat << EOF > /home/pi/.ssh/config
  Host *
    StrictHostKeyChecking no
EOF
chmod 700 /home/pi/.ssh
chmod 400 /home/pi/.ssh/config