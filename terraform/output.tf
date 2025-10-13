output "instance_ip" {
    description = "The public IP address of the EC2 instance"
    value = aws_instance.hello_ec2.public_ip
}