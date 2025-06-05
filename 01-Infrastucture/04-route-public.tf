# Create a public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.benco-vpc.id

  tags = {
    Name = "${var.client_name}-public-route-table"
  }
}

# Create a route to the internet via the Internet Gateway
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Associate the public route table with the public subnet(s)
resource "aws_route_table_association" "public-subnet-associate" {
  subnet_id      = aws_subnet.benco-public-subnet.id
  route_table_id = aws_route_table.public_route_table.id
}




