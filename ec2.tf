resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

    tags = {
    Name = "Ansible Server"
  }

  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  key_name = "talent-academy-lab"
  subnet_id = data.aws_subnet.public_subnet.id
}

  resource "aws_eip" "ansible_eip" {
    instance=aws_instance.ansible_server.id

  }