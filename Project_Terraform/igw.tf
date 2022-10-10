resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myVpc.id

 tags = {
    Name =  var.EnvironmentName 
  }
}