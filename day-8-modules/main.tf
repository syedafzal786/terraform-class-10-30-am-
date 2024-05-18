resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name

    tags = {
      Name = "syed_ec2"
    }
}

resource "aws_s3_bucket" "ayesha" {
    bucket = "kbsbmnnnhvghjjhv"
  
}
