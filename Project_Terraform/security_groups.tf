resource "aws_security_group" "LBSecGroup" {
  name        = "LBSecGroup"
  description = "Allow http to our load balancer"
  vpc_id      = aws_vpc.myVpc.id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Load Balancer Security Group."
  }
}


resource "aws_security_group" "WebServerSecGroup" {
  name        = "WebServerSecGroup"
  description = "Allow http to our hosts and SSH from local only"
  vpc_id      = aws_vpc.myVpc.id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web Server Security Group."
  }
}