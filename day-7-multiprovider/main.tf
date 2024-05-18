provider "aws" {
    region = "ap-south-1"
  
}

provider "aws" {
    region = "us-east-1"
    alias = "test"
  
}
  
resource "aws_s3_bucket" "multiprovider" {
    bucket = "mohammedasd"
    provider = aws.test
  
}

resource "aws_s3_bucket" "test2" {
  bucket = "shaikbanao"
  depends_on = [ aws_s3_bucket.multiprovider ]
  
  
}


