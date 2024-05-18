resource "aws_instance" "dependency" {
  ami           = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name = "syed2"
  tags = {
    Name = "dependency"
  }
}

resource "aws_s3_bucket" "dependency" {
    bucket = "dependency-s3-practice"
    depends_on = [aws_instance.dependency] 
  
}