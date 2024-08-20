#!/bin/bash

# setup Nginx

sudo yum update –y
sudo amazon-linux-extras install nginx1 -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
