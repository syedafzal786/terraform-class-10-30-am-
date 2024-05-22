resource "aws_instance" "multiresourcehandler" {
  ami           = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name = "syed2"

  tags = {
    Name = "foreach"
  }
}

resource "aws_s3_bucket" "sagar" {
    bucket = "ahhhgjkknbnjj"
  
}
# terraform apply -target=aws_s3_bucket.sagar
# terraform destroy -target=aws_s3_bucket.sagar