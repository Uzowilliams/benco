# Creating a VPC with a CIDR block of 10.0.0.0/16 and 
#=====================================================
resource "aws_vpc" "benco-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true


  tags = {
    Name = "${var.client_name}-vpc"
  }
}