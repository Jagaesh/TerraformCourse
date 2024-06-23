terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09e647bf7a368e505" # Amazon Linux 2023 AMI // eu-central-1
  instance_type = "t2.micro"
}
