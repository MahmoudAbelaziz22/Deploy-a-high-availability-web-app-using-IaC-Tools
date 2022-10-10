resource "aws_vpc" "myVpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames= true
  
}