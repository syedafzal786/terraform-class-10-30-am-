provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_key_pair" "syed" {
  key_name   = "provisioner"  # Replace with your desired key name
  public_key = file("~/.ssh/id_ed25519.pub") 

}

resource "aws_instance" "ayush" {
  ami           = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.syed.key_name

  tags = {
    Name = "ayush"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("~/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }
  
 provisioner "local-exec" {
    command = "touch file500"
   
 }
 
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file10"  # Replace with the path to your local file
    destination = "/home/ec2-user/file10"  # Replace with the path on the remote instance
  }
  # remote execution process g
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hello from aws >> file200",
]
 }
}


  
 

