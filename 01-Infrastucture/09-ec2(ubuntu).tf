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

  # SSH connection block
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_key
    host        = self.public_ip
  }

  # Install Docker and unzip, and create necessary folders
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io unzip",
      "sudo systemctl start docker",
      "sudo systemctl enable docker"
    ]
  }

  # Upload app.zip to home directory
  provisioner "file" {
    source      = "app.zip"
    destination = "/home/ubuntu/app.zip"
  }

  # Upload Dockerfile separately
  provisioner "file" {
    source      = "Dockerfile"
    destination = "/home/ubuntu/Dockerfile"
  }

  # Unzip and deploy the app
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ubuntu/app",
      "unzip /home/ubuntu/app.zip -d /home/ubuntu/app",
      "cp /home/ubuntu/Dockerfile /home/ubuntu/app/Dockerfile",
      "cd /home/ubuntu/app",
      "sudo docker build -t my-nginx .",
      "sudo docker run -d -p 80:80 my-nginx"
    ]
  }
}
