resource "aws_launch_configuration" "WebAppLaunchConfig" {
  name_prefix   = "WebAppLaunchConfig"
  image_id      = "ami-00ddb0e5626798373"
  instance_type = "t3.micro"
  security_groups= [aws_security_group.WebServerSecGroup.id]
  user_data = "${file("user-data-apache.sh")}"
ebs_block_device {
device_name = "/dev/sdk"
volume_size = 10
delete_on_termination = true
}
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "WebAppTargetGroup" {
  name        = "WebAppTargetGroup"
  health_check {
    interval = 10
    path = "/" 
    protocol = "HTTP"
    port = 80
    timeout = 8
    healthy_threshold = 2
    unhealthy_threshold = 5
  }
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.myVpc.id
}

resource "aws_autoscaling_group" "WebAppGroup" {
  name                 = "WebAppGroup"
  launch_configuration = aws_launch_configuration.WebAppLaunchConfig.name
  min_size             = 2
  desired_capacity     = 2
  max_size             = 4
  health_check_type    = "ELB"
  load_balancers = [
    aws_elb.WebAppLB.id
  ]
  vpc_zone_identifier  = [
    aws_subnet.PublicSubnet1.id,
    aws_subnet.PublicSubnet2.id
  ]
  target_group_arns= ["${aws_lb_target_group.WebAppTargetGroup.arn}"]
  lifecycle {
    create_before_destroy = true
  }
}