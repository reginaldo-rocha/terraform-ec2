output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.finops_ec2.id
}

output "public_ip" {
  description = "IP público da EC2"
  value       = aws_instance.finops_ec2.public_ip
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.finops_sg.id
}