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
