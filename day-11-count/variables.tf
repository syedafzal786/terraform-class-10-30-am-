variable "ami_id" {
    description = "we will give the value of ami"
    type = string
    default = ""
  
}

variable "instance_type" {
    description = "we will give the value of instance type"
    type = string
    default = ""
  
}

variable "sandboxes" {
  type    = list(string)
  default = ["ec2"]
}

variable "key_name" {
    type = string
    default = ""
  
}

