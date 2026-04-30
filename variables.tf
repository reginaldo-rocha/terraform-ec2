variable "aws_region" {
  description = "Região AWS"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância"
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Nome da EC2"
  default     = "finops-ec2"
}