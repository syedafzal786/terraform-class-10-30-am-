terraform {
  backend "s3" {
    bucket         = "state-umar-store"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamo" # dynamodb table used for state locking. note: first run day-4-statefile
    encrypt        =  true                                 # ensures that state is encrypted at rest in S3
  }
}
