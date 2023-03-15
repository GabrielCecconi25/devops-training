# get ami
data "aws_ami" "ubuntu-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Instance
resource "aws_instance" "instance" {
  count         = 4
  ami           = data.aws_ami.ubuntu-ami.id
  instance_type = "t3a.medium"
  key_name = "key-cecconi"

  vpc_security_group_ids      = ["sg-0fc985488a89b9abf"]
  subnet_id                   = "subnet-0a7e02cd7fcbafeb0"
  associate_public_ip_address = true

  user_data = file("environment.sh")

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 40
    volume_type           = var.volume_type
  }

  tags = {
    Name = var.ec2-name[count.index]
  }
}

resource "aws_eip" "eip" {
  count    = 4
  instance = element(aws_instance.instance.*.id, count.index)
  vpc      = true
}