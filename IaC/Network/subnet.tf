# Subnet
resource "aws_subnet" "subnet" {
  count             = 2
  vpc_id            = element(aws_vpc.vpc.*.id, 0)
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = var.subnet-name[count.index]
    AZ   = "subnet-${(var.azs[count.index])}"
  }
}