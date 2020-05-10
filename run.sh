#!/usr/bin/env bash
mkdir /tmp/oss15.2_MailServer
cd /tmp/oss15.2_MailServer
wget https://raw.githubusercontent.com/darkmac78/darkmac/master/Dockerfile -O /tmp/oss15.2_MailServer/Dockerfile
docker build -t=oss152_mailserver ./
docker images
docker ps -a
rm -rf /tmp/oss15.2_MailServer
