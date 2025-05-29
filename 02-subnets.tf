# Creating a public subnet
#=========================


resource "aws_subnet" "benco-public-subnet" {
  vpc_id     = aws_vpc.benco-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.client_name}-public-subnet"
  }
}

# Creating a private subnet
# #========================

# Subnet 1:


resource "aws_subnet" "benco-private-subnet01" {
  vpc_id     = aws_vpc.benco-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.client_name}-private-subnet-01"
  }
}


# Subnet 2:
# #========

resource "aws_subnet" "benco-private-subnet02" {
  vpc_id     = aws_vpc.benco-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "${var.client_name}-private-subnet-02"
  }
}