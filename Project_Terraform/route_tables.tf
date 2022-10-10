resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.myVpc.id

}

resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.PublicRouteTable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
 
}

resource "aws_route_table_association" "PublicSubnet1RouteTableAssociation" {
  subnet_id      = aws_subnet.PublicSubnet1.id
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table_association" "PublicSubnet2RouteTableAssociation" {
  subnet_id      = aws_subnet.PublicSubnet2.id
  route_table_id = aws_route_table.PublicRouteTable.id
}

resource "aws_route_table" "PrivateRouteTable1" {
  vpc_id = aws_vpc.myVpc.id

}

resource "aws_route" "private_route1" {
  route_table_id            = aws_route_table.PrivateRouteTable1.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.NatGateway1.id
}

resource "aws_route_table_association" "PrivateSubnet1RouteTableAssociation" {
  subnet_id      = aws_subnet.PrivateSubnet1.id
  route_table_id = aws_route_table.PrivateRouteTable1.id
}


resource "aws_route_table" "PrivateRouteTable2" {
  vpc_id = aws_vpc.myVpc.id

}

resource "aws_route" "private_route2" {
  route_table_id            = aws_route_table.PrivateRouteTable2.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.NatGateway2.id
}

resource "aws_route_table_association" "PrivateSubnet2RouteTableAssociation" {
  subnet_id      = aws_subnet.PrivateSubnet2.id
  route_table_id = aws_route_table.PrivateRouteTable2.id
}