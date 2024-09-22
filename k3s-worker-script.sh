#!/bin/bash

set -e

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

sudo su
apt update
apt install docker.io -y
systemctl status docker

# curl -sfL https://get.k3s.io | K3S_URL=https://<MasterNodePublicIP>:6443 K3S_TOKEN=<NodeToken> sh -

# kubectl get nodes

# hostnamectl set-hostname worker-node-1
# echo worker-node-1 > /etc/hostname
# kubectl delete node worker-node-1