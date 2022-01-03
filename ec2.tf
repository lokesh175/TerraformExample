# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "terraform"
}

# Provision ec2 instance
resource "aws_instance" "web" {
  ami           = "ami-04902260ca3d33422" # us-east-1
  instance_type = lookup(var.inst_type, terraform.workspace, "t2.micro")
  key_name = "myCentos"

  tags = {
    Name = "TF Instance"
  }
}

variable "inst_type" {
  type = map
  default = {
      dev = "t2.nano"
      qa = "t2.micro"
      prod = "t2.medium"
  }
}

