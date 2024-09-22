data "aws_ami" "latest-ubuntu-image" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "k3s-Master-server" {
  ami                         = data.aws_ami.latest-ubuntu-image.id
  instance_type               = var.instance_type
  key_name                    = "devops"
  subnet_id                   = aws_subnet.k3s-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("k3s-server-script.sh")
  tags = {
    Name = "${var.env_prefix}-Master"
  }
}
# K3s Worker Node Instances (Fixed at 2 instances)
resource "aws_instance" "k3s-worker" {
  count                       = 1  # Always start with 2 instances
  ami                         = data.aws_ami.latest-ubuntu-image.id
  instance_type               = var.instance_type
  key_name                    = "devops"
  subnet_id                   = aws_subnet.k3s-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("k3s-worker-script.sh")  
  tags = {
    Name = "${var.env_prefix}-worker-${count.index + 1}"  # Unique name for each worker (e.g., worker-1, worker-2)
  }
}