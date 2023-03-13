# Route Table
resource "aws_route_table" "route_igw" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pub_rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "a" {
  count          = 2
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.route_igw.id
}