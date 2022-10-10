resource "aws_eip" "NatGateway1EIP" {

}

resource "aws_eip" "NatGateway2EIP" {

}


resource "aws_nat_gateway" "NatGateway1" {
  allocation_id = aws_eip.NatGateway1EIP.id
  subnet_id     = aws_subnet.PublicSubnet1.id

  tags = {
    Name = "  ${var.EnvironmentName} gw NAT 1"
  }
}

resource "aws_nat_gateway" "NatGateway2" {
  allocation_id = aws_eip.NatGateway2EIP.id
  subnet_id     = aws_subnet.PublicSubnet2.id

  tags = {
    Name = "  ${var.EnvironmentName} gw NAT 2"
  }
}