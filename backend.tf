terraform {
  backend "s3" {
    bucket = "remote-state-app"
    region = "us-east-1"
    key    = "k3s-server/terraform.tfstate"
  }
}
