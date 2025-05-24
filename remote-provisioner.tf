# resource "aws_instance" "myec21" {
#   ami = "ami-0c2b8ca1dad447f8a"
#   instance_type = "t2.micro"
#   key_name = "bhaskar"
#
#   provisioner "remote-exec" {
#     inline = [
#       "sudo amazon-linux-extras install -y nginx1.12",
#       "sudo systemctl start nginx"
#     ]
#   connection {
#     type = "ssh"
#     user = "ec2-user"
#     private_key = file("./bhaskar.pem")
#     host = self.public_ip
#   }
#   }
# }
