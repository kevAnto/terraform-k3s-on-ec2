terraform {
  backend "s3" {
    bucket = "remote-state-app"
    region = "us-east-1"
    key    = "node-server/terraform.tfstate"
  }
}
