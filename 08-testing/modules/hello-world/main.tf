terraform {
  cloud {
    organization = "CharlesCloudJourney"

    workspaces {
      name = "terraform-from-beginner-to-pro-test"
    }
  }

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

variable "instance_ip_addr_2" {
  description = "The IP address of the instance"
  type        = string
  default     = "127.0.0.1"
}

output "instance_ip_addr_2" {
  value = var.instance_ip_addr_2
}
