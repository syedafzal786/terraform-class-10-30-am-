resource "aws_instance" "syed" {
  ami           = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name = "syed2"
  user_data = file("test.sh")
  tags = {
    Name = "syed"
  }
}