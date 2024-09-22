#!/bin/bash

set -e

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

sudo su
apt update
curl -sfL https://get.k3s.io | sh -
apt install docker.io -y
systemctl status k3s
# sudo cat /var/lib/rancher/k3s/server/node-token