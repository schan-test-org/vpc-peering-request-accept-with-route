############################################
# version of terraform and providers
############################################
terraform {
  cloud {
    organization = "MZC-ORG"

    workspaces {}
  }

  # required_providers {
  #   aws = {
  #     source = "hashicorp/aws"
  #     configuration_aliases = [
  #       aws.accepter,
  #       aws.requester,
  #     ]
  #   }
  #   template = {
  #     source = "hashicorp/template"
  #   }
  # }

}


############################################
# AWS Provider Configuration
############################################
#requester
provider "aws" {
  # alias  = "requester"
  region = local.requester_region

# TFC 콘솔 변수로 입력
  access_key = var.requester_key
  secret_key = var.requester_secret
}


## accepter
provider "aws" {
  alias  = "accepter"
  region = local.accepter_region

# TFC 콘솔 변수로 입력
  access_key = var.accepter_key
  secret_key = var.accepter_secret

  # default_tags {
  #   tags = {
  #     Accepter        = "accepter"
  #   }
  # }

}