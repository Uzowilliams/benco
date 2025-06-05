# Create elastic ip address
#===========================
resource "aws_eip" "elp-nat" {
  domain = "vpc"
}

# Craete nat gateway
#========================
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elp-nat.id
  subnet_id     = aws_subnet.benco-private-subnet01.id

  tags = {
    Name = "${var.client_name}-nat-gateway"
  }
}