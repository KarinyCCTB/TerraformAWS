provider "tls" {}

resource "tls_private_key" "access_key" { 
	algorithm = "RSA" 
	rsa_bits = 2048
}

resource "aws_key_pair" "access" { 
	key_name = var.key_name 
	public_key = tls_private_key.access_key.public_key_openssh
}

output "private_key_pem" { 
	value = tls_private_key.access_key.private_key_pem 
	sensitive = true
}
