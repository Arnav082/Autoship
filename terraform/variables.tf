variable "aws_region" {
  default = "us-east-1"
}

variable "aws_instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "devops-key"
}

data "aws_ami" "amiID" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "project_key" {
  key_name   = "devops-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG4ZAelAtLEhxHaV7Fi8LeQCsszo3LYCaxhHeDfkKZzZ arnav@Arnav"
}