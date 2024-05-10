# create vpc

resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "cust_vpc"
  }
}
# create subnet

resource "aws_subnet" "dev" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = "10.0.0.0/21"
  availability_zone = "ap-south-1a"
}
# create IG and attach to vpc

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "cust-ig"
  }

}
# create RT and configure IG (edit routes)

resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
}
# subnet association to add into RT (public)

resource "aws_route_table_association" "dev" {
  subnet_id      = aws_subnet.dev.id
  route_table_id = aws_route_table.dev.id

}
# creation of sg
resource "aws_security_group" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
# creation of ec2
resource "aws_instance" "Name" {
  ami           = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  key_name      = "syed2"
  subnet_id     = aws_subnet.dev.id
  vpc_security_group_ids = [aws_security_group.dev.id]
     
  tags = {
    Name = "myec2"
  }
}


