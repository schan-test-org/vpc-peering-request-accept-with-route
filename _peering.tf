
############################# peering configuratio #######################################

# data "aws_availability_zones" "available" {
#   provider = aws.peer
# }

resource "aws_vpc_peering_connection" "this" {
  # provider    = aws.requester
  vpc_id      = var.requester_vpc_id
  peer_region = local.accepter_region
  peer_vpc_id = var.accepter_vpc_list.accepter.vpc_id
  peer_owner_id = data.aws_vpc.accepter.owner_id
  # peer_owner_id = var.accepter_vpc_info.peer_owner_id
  auto_accept = false

  tags = {
    Name = "from-${var.accepter_vpc_list.accepter.acpt_vpc_name}"
    Requester_vpc = var.requester_vpc_cidr
    Accpeter_vpc = var.accepter_vpc_list.accepter.vpc_cidr
  }

}

####  aws_vpc_peering_connection_accepter ####
resource "aws_vpc_peering_connection_accepter" "this" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  # vpc_peering_connection_id = var.vpc_peering_connection_id
  auto_accept               = true

  tags = {
    Name = "to-${var.requester_vpc_name}"
    Requester_vpc = var.requester_vpc_cidr
    Accpeter_vpc = var.accepter_vpc_list.accepter.vpc_cidr
  }

}



