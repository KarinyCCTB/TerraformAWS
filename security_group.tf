
resource "aws_security_group" "devops_sg" { 
	name = "devops_sg" 
	description = "Security group for EC2 instances, Load Balancer, and Jenkins" 
	vpc_id = aws_vpc.devops_vpc.id

	ingress { 
		from_port = 22 
		to_port = 22 
		protocol = "tcp" 
		cidr_blocks = ["0.0.0.0/0"] 
	}

	ingress { 
		from_port = 80 
		to_port = 80 
		protocol = "tcp" 
		cidr_blocks = ["0.0.0.0/0"] 
	}

	ingress { 
		from_port = 0 
		to_port = 65535 
		protocol = "tcp" 
		cidr_blocks = [var.vpc_cidr_block] 
	}
  
	egress { 
		from_port = 0 
		to_port = 0 
		protocol = "-1" 
	}
}

resource "aws_security_group" "lb_sg" { 
	name = "lb_sg" 
	description = "Security group for Load Balancer" 
	vpc_id = aws_vpc.devops_vpc.id
	
	ingress { 
		from_port = 80 
		to_port = 80 
		protocol = "tcp" 
		cidr_blocks = ["0.0.0.0/0"] 
	}
	
	egress { 
		from_port = 0 
		to_port = 0
		protocol = "-1"
	}
}
