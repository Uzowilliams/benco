resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.benco-vpc.id

  egress {
    protocol   = "-1"              # All protocols
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0                 # Must be 0 when protocol = "-1"
    to_port    = 0                 # Must be 0 when protocol = "-1"
  }

  ingress {
    protocol   = "-1"              # All protocols
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.client_name}-network-acl"
  }
}

# Associate the NACL with public Subnet
resource "aws_network_acl_association" "private-subnet-01-association" {
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = aws_subnet.benco-private-subnet01.id
}

resource "aws_network_acl_association" "private-subnet-02-association" {
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = aws_subnet.benco-private-subnet02.id
}