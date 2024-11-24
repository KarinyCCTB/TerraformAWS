resource "aws_instance" "production_env1" { 
	ami = "ami-0453ec754f44f9a4a" 
	instance_type = var.instance_type 
	subnet_id = aws_subnet.subnet_1.id 
	key_name = aws_key_pair.access.key_name 
	vpc_security_group_ids = [aws_security_group.devops_sg.id] 
	tags = { 
		Name = "Production_Env1"
  }
}

resource "aws_instance" "production_env2" { 
	ami = "ami-0453ec754f44f9a4a" 
	instance_type = var.instance_type 
	subnet_id = aws_subnet.subnet_2.id 
	key_name = aws_key_pair.access.key_name 
	vpc_security_group_ids = [aws_security_group.devops_sg.id] 
	tags = { 
		Name = "Production_Env2"
  }
}

resource "aws_instance" "jenkins_controller" { 
	ami = "ami-0453ec754f44f9a4a" 
	instance_type = var.instance_type 
	subnet_id = aws_subnet.subnet_3.id 
	key_name = aws_key_pair.access.key_name 
	vpc_security_group_ids = [aws_security_group.devops_sg.id] 
	tags = {
		Name = "JenkinsController"
  }
}

resource "aws_instance" "testing_env" { 
	ami = "ami-0453ec754f44f9a4a" 
	instance_type = var.instance_type 
	subnet_id = aws_subnet.subnet_1.id 
	key_name = aws_key_pair.access.key_name 
	vpc_security_group_ids = [aws_security_group.devops_sg.id] 
	tags = { 
		Name = "Testing_Env"
  }
}

resource "aws_instance" "staging_env" { 
	ami = "ami-0453ec754f44f9a4a"
	instance_type = var.instance_type 
	subnet_id = aws_subnet.subnet_2.id
	key_name = aws_key_pair.access.key_name 
	vpc_security_group_ids = [aws_security_group.devops_sg.id] 
	tags = { 
		Name = "Staging_Env"
  }
}
