############################# main : local #######################################
locals {
  common_tags = merge(var.default_tags, {
    "region"  = var.aws_region
    "project" = var.project
    "env"     = var.env
    "managed" = "terraform"

  })

  requester_region = var.aws_region
  accepter_region = var.aws_region

  requester_route_tables_ids = data.aws_route_tables.requester.ids
  accepter_route_tables_ids  = data.aws_route_tables.accepter.ids


}

############################# data : vpc-igw ##################################

data "aws_vpc" "requester" {
  id       = var.requester_vpc_id
  # provider = aws.requester
}

data "aws_vpc" "accepter" {
  id       = var.accepter_vpc_list.accepter.vpc_id
  provider = aws.accepter
}

#########

data "aws_route_tables" "requester" {
  vpc_id   = var.requester_vpc_id
  # provider = aws.requester
}

data "aws_route_tables" "accepter" {
  vpc_id   = var.accepter_vpc_list.accepter.vpc_id
  provider = aws.accepter
}





