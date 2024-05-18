module "third-module" {
  source = "github.com/syedafzal786/terraform-class-10-30-am-/day-3-custom-NW"
  ami_id = "ami-013e83f579886baeb"
  instance_type = "t2.micro"
 
}