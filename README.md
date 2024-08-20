# terraform-code-to-run-k3s-on-an-ec2
Prerequisites
An AWS account. If you don’t have one, you can register here.

A key pair. If you don’t have one, refer to Creating a key pair.

An AWS IAM User with programmatic key access and permissions to launch EC2 instances


Steps for the project

* Set your remote state
* terraform init
* terraform apply

Access the Kubeconfig File on the EC2 Instance
 * SSH into the EC2 Instance

 * Locate the Kubeconfig File:
The Kubeconfig file for K3s is usually located at /etc/rancher/k3s/k3s.yaml.

`sudo cat /etc/rancher/k3s/k3s.yaml`

 * Modify the Server Address:
The k3s.yaml file will have a server field that looks like https://127.0.0.1:6443. You need to change this to point to the public IP address or DNS name of your EC2 instance.

 * Setup KUBECONFIG Environment Variable
 place your k3s-ec2-kubeconfig.yaml file is in your home directory and do:

`export KUBECONFIG=~/k3s-ec2-kubeconfig.yaml`