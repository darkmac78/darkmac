#!/usr/bin/env bash
mkdir /tmp/oss15.2_Mailserver
cd /tmp/oss15.2_MailServer
wget https://github.com/darkmac78/darkmac/blob/master/Dockerfile -O /tmp/oss15.2_MailServer/Dockerfile
docker build -t=oss152_mailserver ./
docker images
docker ps -a
