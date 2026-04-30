# Security Group
resource "aws_security_group" "finops_sg" {
  name        = "finops-security-group"
  description = "Permite SSH e HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "finops-security-group"
    Project     = "FinOps"
    Owner       = "SeuNome"
    Environment = "Lab"
    CostCenter  = "Cloud"
  }
}

# EC2 Instance
resource "aws_instance" "finops_ec2" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.finops_sg.id]

  associate_public_ip_address = true

  tags = {
    Name        = var.instance_name
    Project     = "FinOps"
    Owner       = "SeuNome"
    Environment = "Lab"
    CostCenter  = "Cloud"
  }
}