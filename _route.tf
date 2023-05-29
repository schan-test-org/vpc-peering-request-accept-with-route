######################################################### ################################
resource "aws_route" "requester" {
  depends_on = [ aws_vpc_peering_connection.this ]
  # provider                  = aws.requester
  count                     = length(local.requester_route_tables_ids)
  route_table_id            = local.requester_route_tables_ids[count.index]
  destination_cidr_block    = var.accepter_vpc_list.accepter.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
  # vpc_peering_connection_id = data.aws_vpc_peering_connection.requester.id
  # vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "accepter" {
  depends_on = [ aws_vpc_peering_connection.this ]
  provider                  = aws.accepter
  count                     = length(local.accepter_route_tables_ids)
  route_table_id            = local.accepter_route_tables_ids[count.index]
  destination_cidr_block    = var.requester_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

