resource "aws_subnet" "PublicSubnet1" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = var.publicsubnet1_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch= true
  tags = {
    Name = " ${var.EnvironmentName} public subnet 1"
  }
}

resource "aws_subnet" "PublicSubnet2" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = var.publicsubnet2_cidr_block
    availability_zone = "us-east-1b"
  map_public_ip_on_launch= true
  tags = {
    Name = " ${var.EnvironmentName} public subnet 2"
  }
}


resource "aws_subnet" "PrivateSubnet1" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = var.privatesubnet1_cidr_block
  map_public_ip_on_launch= false
  tags = {
    Name = " ${var.EnvironmentName} private subnet 1"
  }
}

resource "aws_subnet" "PrivateSubnet2" {
  vpc_id     = aws_vpc.myVpc.id
  cidr_block = var.privatesubnet2_cidr_block
  map_public_ip_on_launch= false
  tags = {
    Name = " ${var.EnvironmentName} private subnet 2"
  }
}