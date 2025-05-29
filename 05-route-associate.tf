# Associate the public route table with the public subnet
#========================================================

resource "aws_route_table_association" "public-route-associate" {
  subnet_id      = aws_subnet.benco-public-subnet.id
  route_table_id = aws_route_table.public_route_table.id

}
