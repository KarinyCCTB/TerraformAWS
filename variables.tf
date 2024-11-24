
variable "aws_region" { 
	description = "The AWS region to deploy to." 
	default = "us-east-1"
}

variable "vpc_cidr_block" { 
	description = "CIDR block for the VPC." 
	default = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" { 
	description = "List of subnet CIDR blocks." 
	type = list(string) 
	default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "instance_type" { 
	description = "EC2 instance type." 
	default = "t2.micro"
}

variable "key_name" { 
	description = "The AWS key pair name to use for EC2 instances." 
	default = "access" # Name of the key pair to be created
}
