resource "aws_instance" "web" {
  ami                    = "ami-0cc9838aa7ab1dce7"      #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "syed2"              #change key name as per your setup
 
  tags = {
    Name = "project-MainEc2"
  }

  root_block_device {         #we can give custom value here 
  volume_size = 40
 }
}

resource "aws_security_group" "devops-project-syed" {
  name        = "devops-project-syed"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000, 8082, 8081] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-project-syed"
  }
}