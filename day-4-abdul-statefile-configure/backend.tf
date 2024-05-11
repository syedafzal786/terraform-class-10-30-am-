terraform {
  backend "s3" {
    bucket = "state-mohammed-store"
    key    = "project-3/terraform.tfstate"
    region = "ap-south-1"
  }
}
