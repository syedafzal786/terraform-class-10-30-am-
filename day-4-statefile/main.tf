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

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockId"
  read_capacity  = 20
  write_capacity = 20
 
   attribute {
    name = "LockId"
    type = "S"
  }
  

}
