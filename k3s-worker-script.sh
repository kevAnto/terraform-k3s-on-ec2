#!/bin/bash

set -e

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

apt update
apt install docker.io -y

hostnamectl set-hostname worker-node-1
echo worker-node-1 > /etc/hostname
#kubectl delete node worker-node-1