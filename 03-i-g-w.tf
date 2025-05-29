resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.benco-vpc.id

  tags = {
    Name = "${var.client_name}-internet-gateway"
  }
}