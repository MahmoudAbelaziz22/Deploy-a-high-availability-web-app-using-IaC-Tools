output "VPC_ID" {
  value = aws_vpc.myVpc.id

}

output "VPCPublicRouteTable" {
  value = aws_route_table.PublicRouteTable.id
 
}

output "VPCPrivateRouteTable1" {
  value = aws_route_table.PrivateRouteTable1.id

}


output "VPCPrivateRouteTable2" {
  value = aws_route_table.PrivateRouteTable2.id

}

output "PublicSubnets" {
  value= [ aws_subnet.PublicSubnet1 , aws_subnet.PublicSubnet2 ]

}

output "PrivateSubnets" {
  value= [ aws_subnet.PrivateSubnet1 , aws_subnet.PrivateSubnet2 ]

}

output "PublicSubnet1" {
  value= aws_subnet.PublicSubnet1.id

}

output "PublicSubnet2" {
  value= aws_subnet.PublicSubnet2.id

}

output "PrivateSubnet1" {
  value= aws_subnet.PrivateSubnet1.id

}

output "PrivateSubnet2" {
  value= aws_subnet.PrivateSubnet2.id

}