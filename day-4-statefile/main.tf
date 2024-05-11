resource "aws_s3_bucket" "mohammed" {
    bucket = "state-mohammed-store"
  
}

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.mohammed.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.mohammed.id
  versioning_configuration {
    status = "Enabled"
  }
}