#!/usr/bin/env bash
mkdir /tmp/oss15.2_MailServer; cd /tmp/oss15.2_MailServer; wget https://raw.githubusercontent.com/darkmac78/darkmac/master/Dockerfile
clear; echo "Building the openSUSE15.2 image..."; sleep 3
docker build -t=oss152_mailserver ./; 
clear
echo "Docker Images:"
docker images
docker run -d --name=oss15_MailServer -v /sys/fs/cgroup:/sys/fs/cgroup:ro oss152_mailserver
echo "Running containers:"
docker ps -a
rm -rf /tmp/oss15.2_MailServer
