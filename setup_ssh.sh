#!/bin/bash
echo '----> create ssh dir'
SSH_DIR=/home/pi/.ssh
mkdir -p ${SSH_DIR}

echo '----> crete ssh config file'
cat << EOF > ${SSH_DIR}/config
  Host jenkins-slave
    User jenkins
    HostName slave.pitux.ovh
    Port 22
    StrictHostKeyChecking no
EOF

echo '----> get jenkins key'
ssh-keyscan slave.pitux.ovh > ${SSH_DIR}/known_hosts

echo '----> add jenkins to authorized keys'
cat << EOF > ${SSH_DIR}/authorized_keys
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeZUw8t66NCXTO1ISY+/oMwYbYlMEQ0RTlTPVhp4xaQ8718nexgDM6lbUd3UbiVLBvu/FPPHyoFeP5RN1diAEKDjn65igePSCD5ikpUoiE3ETX+mYe0FJlazuiIbdVmOo1EzFYuzRsL1i+63wSqBgEkmQB3lxNlbsq8QCJBngR8V3IUmgJq6EGuIHVRvNvulzTSN74qUzzv1ue7rfWQwLXKwUkQuXwOv0ADPW6brqXke7q+YEfcxBo3q3UsxB+abAe+ty3oA6cifHKwCMqYKPh541YsuzZ6vpuhIFU9ESXqp+mDzmFpJjX/Gcaxm7MaiF2UQm6qczqS+EhvC7zLqZp jenkins@master-debian8-local
EOF

echo '----> set file permissions'
chown -R pi:pi ${SSH_DIR}
chmod g-w /home/pi
chmod 700 ${SSH_DIR}
chmod 400 ${SSH_DIR}/config
chmod 644 ${SSH_DIR}/authorized_keys
