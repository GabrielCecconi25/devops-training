# VPC (Virtual Private Cloud)
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_lab-k8s"
  }
}