# get ami
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }
}

# Instance
resource "aws_instance" "instance" {
  count = 4
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3a.medium"
  vpc_security_group_ids      = ["sg-0fc985488a89b9abf"]
  subnet_id = "subnet-0a7e02cd7fcbafeb0"
  associate_public_ip_address = true

  tags = {
    Name = var.ec2-name[count.index]
  }
}

resource "aws_eip" "eip" {
  count = 4
  instance = element(aws_instance.instance.*.id, count.index)
  vpc      = true
}