locals {
  bucket-name = "${var.layer}-${var.env}-bucket-hydnaresh"
  # bucket-name = "development-dev-bucket-hydnaresh"
}

resource "aws_s3_bucket" "demo" {
    # bucket = "web-dev-bucket"
    # bucket = "${var.layer}-${var.env}-bucket-hyd"
     bucket = local.bucket-name
    # bucket = "development-dev-bucket-hydnaresh"
    tags = {
        # Name = "${var.layer}-${var.env}-bucket-hyd"
        Name = local.bucket-name
      # Name = development-dev-bucket-hydnaresh
        Environment = var.env
    }
    
 
  
}