
# Terraform-Project-7: Using Splat Expressions and Provisioners

This Terraform project demonstrates the use of **Splat Expressions** and **Provisioners** to manage AWS infrastructure efficiently.

## 🔹 What This Project Does

- Creates multiple EC2 instances using `count`.
- Uses **Splat Expressions** to fetch and output data from all created instances.
- Uses **Provisioners** to run commands on the EC2 instances after they are launched (e.g., installing software or performing configuration tasks).


### ✅ Splat Expressions

Splat expressions (`[*]`) are a shorthand way to access a list of attributes from multiple similar resources. For example:

```hcl
output "instance_ips" {
  value = aws_instance.example[*].public_ip
}

### ✅ Provisioners

Provisioners allow you to execute scripts or commands on a resource after it's created. This can be useful for tasks like installing software or copying files.

```hcl
provisioner "remote-exec" {
  inline = [
    "sudo apt update",
    "sudo apt install nginx -y"
  ]
}
