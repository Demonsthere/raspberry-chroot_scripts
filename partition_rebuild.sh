#!/bin/bash -x

echo '----> Rebuilding the system partition table'
sudo fdisk dev/mmcblk0 << EOF || true
d
2
n
p
2


w
EOF
