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


module "web_app" {
  source = "./modules/hello-world"
}

output "instance_ip_addr" {
  value = module.web_app.instance_ip_addr
}

output "url" {
  value = "http://${module.web_app.instance_ip_addr}:8080"
}
