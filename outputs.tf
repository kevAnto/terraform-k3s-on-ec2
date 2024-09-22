output "ec2_public_ip" {
  value = aws_instance.k3s-Master-server.public_ip
}