resource "aws_instance" "Name" {
  ami           = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  key_name      = "syed2"
  
  tags = {
    Name = "myec2"
  }
}

