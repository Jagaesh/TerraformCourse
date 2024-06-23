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

variable "db_pass_1" {
  description = "password for database #1"
  type        = string
  sensitive   = true
  default     = "bar"
}

variable "db_pass_2" {
  description = "password for database #2"
  type        = string
  sensitive   = true
  default     = "bar"
}

module "web_app_1" {
  source = "./web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-1-data"
  domain           = "devopsdeployed.com"
  app_name         = "web-app-1"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = false
  db_name          = "webapp1db"
  db_user          = "foo"
  db_pass          = var.db_pass_1
}

module "web_app_2" {
  source = "./web-app-module"

  # Input Variables
  bucket_prefix    = "web-app-2-data"
  domain           = "anotherdevopsdeployed.com"
  app_name         = "web-app-2"
  environment_name = "production"
  instance_type    = "t2.micro"
  create_dns_zone  = false
  db_name          = "webapp2db"
  db_user          = "bar"
  db_pass          = var.db_pass_2
}
