resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http into VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "myec22" {
   ami = "ami-03a13a09a711d3871"
   instance_type = "t2.micro"
   key_name = "Mar2025"
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     inline = [
       "sudo yum -y install httpd",
       "sudo service httpd start",
       "sudo service httpd status"
     ]
   }
   provisioner "remote-exec" {
     on_failure = continue
       when    = destroy
       inline = [
         "sudo yum -y remove httpd"
       ]
     }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./Mar2025.pem")
     host = self.public_ip
   }
}
