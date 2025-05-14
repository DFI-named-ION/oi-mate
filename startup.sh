#!/usr/bin/env bash
exec >> /var/log/startup.log 2>&1
set -eux

echo "=== STARTUP SCRIPT BEGIN !==="
date

apt-get update
apt-get install -y docker.io

echo "=== DOCKER INSTALLED ==="

systemctl enable docker
systemctl start docker

docker run -d --name webapp -p 80:80 selnter/cool-lab4-5:latest
docker run -d --name watchtower --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower --interval 30 webapp
