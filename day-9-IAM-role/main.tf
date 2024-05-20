provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "example_role" {
  name = "examplerole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.example_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_instance_profile" "example_profile" {
  name = "example_profile"
  role = aws_iam_role.example_role.name
}

resource "aws_instance" "example_instance" {
  ami           = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  
  iam_instance_profile = aws_iam_instance_profile.example_profile.name

  tags = {
    Name = "exampleinstance"
  }
}

resource "aws_s3_bucket" "motisl" {
  bucket = "motisl"
}

resource "aws_s3_bucket_policy" "motisl" {
  bucket = aws_s3_bucket.motisl.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.example_role.name}"
        },
        "Action": [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        "Resource": [
          "arn:aws:s3:::motisl",
          "arn:aws:s3:::motisl/*"
        ]
      }
    ]
  })
}

data "aws_caller_identity" "current" {}