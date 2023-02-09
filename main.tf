provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("key.pem")}"
	host = aws_instance.example.public_ip
  }

  provisioner "file" {
    source      = "sensitive-info.sh"
    destination = "/tmp/sensitive-info.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/sensitive-info.sh",
      "/tmp/sensitive-info.sh"
    ]
  }

  provisioner "local-exec" {
    command = "provision.sh"
  }

  vpc_security_group_ids = ["${aws_security_group.example.id}"]
}

resource "aws_security_group" "example" {
  name = "example"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
