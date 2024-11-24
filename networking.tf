resource "aws_vpc" "devops_vpc" { 
	cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet_1" { 
	vpc_id = aws_vpc.devops_vpc.id 
	cidr_block = var.subnet_cidr_blocks[0] 
	availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_2" { 
	vpc_id = aws_vpc.devops_vpc.id 
	cidr_block = var.subnet_cidr_blocks[1] 
	availability_zone = "us-east-1b"
}

resource "aws_subnet" "subnet_3" { 
	vpc_id = aws_vpc.devops_vpc.id 
	cidr_block = var.subnet_cidr_blocks[2] 
	availability_zone = "us-east-1c"
}

resource "aws_internet_gateway" "devops_igw" { 
	vpc_id = aws_vpc.devops_vpc.id
}

resource "aws_route_table" "devops_route_table" { 
	vpc_id = aws_vpc.devops_vpc.id
}

resource "aws_route" "devops_route" { 
	route_table_id = aws_route_table.devops_route_table.id 
	destination_cidr_block = "0.0.0.0/0" 
	gateway_id = aws_internet_gateway.devops_igw.id
}

resource "aws_route_table_association" "subnet_1_association" { 
	subnet_id = aws_subnet.subnet_1.id 
	route_table_id = aws_route_table.devops_route_table.id
}

resource "aws_route_table_association" "subnet_2_association" { 
	subnet_id = aws_subnet.subnet_2.id 
	route_table_id = aws_route_table.devops_route_table.id
}

resource "aws_route_table_association" "subnet_3_association" { 
	subnet_id = aws_subnet.subnet_3.id 
	route_table_id = aws_route_table.devops_route_table.id
}
