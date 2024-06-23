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

############################################################
##
## NOTE: if you are deploying this in your production setup
## follow the instructions in the github repo on how to modify
## deploying with the defaults here as an example of the power
## of modules.
##
## REPO: https://github.com/hashicorp/terraform-aws-consul
##
############################################################
module "consul" {
  # source = "git@github.com:hashicorp/terraform-aws-consul.git"
  source = "git::https://github.com/hashicorp/terraform-aws-consul.git"
}
