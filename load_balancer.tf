
resource "aws_lb" "prod_lb" { 
	name = "prod-lb" 
	internal = false 
	load_balancer_type = "application"
	security_groups = [aws_security_group.lb_sg.id] 
	subnets = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id, aws_subnet.subnet_3.id] 
	enable_deletion_protection = false
}

resource "aws_lb_target_group" "prod_target_group" { 
	name = "prod-target-group" 
	port = 80 
	protocol = "HTTP" 
	target_type = "instance" 
	vpc_id = aws_vpc.devops_vpc.id
}

resource "aws_lb_listener" "prod_listener" { 
	load_balancer_arn = aws_lb.prod_lb.arn 
	port = 80 
	protocol = "HTTP" 
	
	default_action {
		type = "forward" 
		target_group_arn = aws_lb_target_group.prod_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "prod_env1_attachment" { 
	target_group_arn = aws_lb_target_group.prod_target_group.arn 
	target_id = aws_instance.production_env1.id 
	port = 80
}

resource "aws_lb_target_group_attachment" "prod_env2_attachment" { 
	target_group_arn = aws_lb_target_group.prod_target_group.arn 
	target_id = aws_instance.production_env2.id 
	port = 80
}
