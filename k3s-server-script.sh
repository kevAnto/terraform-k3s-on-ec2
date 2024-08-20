#!/bin/bash

set -e

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary dependencies
echo "Installing necessary dependencies..."
sudo apt-get install -y curl

# Disable swap (K3s requires swap to be disabled)
echo "Disabling swap..."
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

# Install K3s
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

# Check if K3s is running
echo "Checking K3s status..."
sudo systemctl status k3s

# Set up kubeconfig for root user
echo "Setting up kubeconfig for root user..."
sudo mkdir -p /root/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /root/.kube/config
sudo chown $(id -u):$(id -g) /root/.kube/config

# (Optional) Set up kubeconfig for the ubuntu user (or your preferred user)
USER_HOME="/home/ubuntu"
if [ -d "$USER_HOME" ]; then
  echo "Setting up kubeconfig for the ubuntu user..."
  sudo mkdir -p $USER_HOME/.kube
  sudo cp /etc/rancher/k3s/k3s.yaml $USER_HOME/.kube/config
  sudo chown ubuntu:ubuntu $USER_HOME/.kube/config
fi

# Verify K3s installation
echo "Verifying K3s installation..."
kubectl get nodes

echo "K3s installation and setup completed successfully!"