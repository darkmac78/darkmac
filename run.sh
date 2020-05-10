#!/usr/bin/env bash
mkdir /tmp/oss15.2_MailServer
cd /tmp/oss15.2_MailServer
wget https://raw.githubusercontent.com/darkmac78/darkmac/master/Dockerfile
clear
echo "Building the openSUSE15.2 image..."
sleep 3
docker build -t=oss152_mailserver ./
docker images
clear
docker run -d --name=oss15_MailServer -v /sys/fs/cgroup:/sys/fs/cgroup:ro oss152_mailserver
clear
echo "Checking if the images were create (you should have 2 images: opensuse/leap:15.2 and oss152_mailserver"
docker images
sleep 5
clear
echo "Checking if the container is running..."
docker ps -a
sleep 5
rm -rf /tmp/oss15.2_MailServer
