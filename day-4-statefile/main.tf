provider "aws" {
  region = "ap-south-1"

}
resource "aws_s3_bucket" "umar" {
  bucket = "state-umar-store"

}

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.umar.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.umar.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
