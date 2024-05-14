terraform {
  backend "s3" {
    bucket = "state-mohammed-store"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-syed-afzal-dynamo" # dynamodb table used for state locking. note: first run day-4-statefile
    encrypt = true # ensures that state is encrypted at rest in S3

  }
}
