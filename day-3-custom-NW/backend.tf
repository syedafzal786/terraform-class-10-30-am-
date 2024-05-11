terraform {
  backend "s3" {
    bucket = "state-mohammed-store"
    key    = "project-4/terraform.tfstate"
    region = "ap-south-1"
  }
}
