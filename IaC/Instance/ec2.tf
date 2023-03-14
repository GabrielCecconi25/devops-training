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
  vpc_security_group_ids      = [""]
  subnet_id = ""
  associate_public_ip_address = true

  tags = {
    Name = var.ec2-name[count.index]
  }
}

resource "aws_eip" "eip" {
  count = 4
  instance = aws_instance.instance[count.index]
  vpc      = true
}