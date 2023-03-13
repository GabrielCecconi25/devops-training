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

resource "aws_instance" "k8s1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3a.micro"

  tags = {
    Name = "k8s-1"
  }
}