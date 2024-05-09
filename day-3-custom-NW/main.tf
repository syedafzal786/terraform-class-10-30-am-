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
# creation of ec2
resource "aws_instance" "Name" {
  ami           = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
  key_name      = "syed2"
  subnet_id     = aws_subnet.dev.id
  

  tags = {
    Name = "myec2"
  }

}

