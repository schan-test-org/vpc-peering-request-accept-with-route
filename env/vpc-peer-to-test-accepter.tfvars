
########################################
# Common
########################################
project     = "test-2023"
aws_region  = "ap-northeast-2"


default_tags = {
  dept  = "DEVOPS/TERRAFORM-CLOUD-GITOPS-TESTING"
  email = "schan@mz.co.kr"
}

########################################
# wsk setting
########################################
env = "dev"


########################################
# vpc-peer-about
########################################

requester_vpc_id = "vpc-037a4fd4fdd220e52"
requester_vpc_cidr = "10.100.0.0/16"
requester_vpc_name = "test-2023-vpc"

# Peering List
accepter_vpc_list =  {
  # accpeter1 = {
  #     vpc_id                      = "<< VPC ID >>"
  #     vpc_cidr                         = "<< VPC CIDR >>"
  #     owner_id                    = "<< Owner Account ID >>"
  #     acpt_vpc_name                    = "<< Peering VPC Name >>"
  # }

## test-account
  accepter = {
      vpc_id                      = "vpc-0e8acf616f7d0dd34"
      vpc_cidr                         = "10.20.0.0/16"
      owner_id                    = "<< Owner Account ID >>"
      acpt_vpc_name                    = "test-accepter-vpc"
  }


}


