resource "aws_instance" "web" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.benco-public-subnet.id
  key_name                    = "benco-key"
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.benco_sg.id
  ]

  tags = {
    Name = "${var.client_name}-web-server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("C:/Users/USER/Downloads/benco-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}

