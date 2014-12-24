# Configure the AWS Provider
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "ap-southeast-1"
}

#Create security group
resource "aws_security_group" "allow_all" {
  name = "allow_all"
    description = "Allow all inbound traffic"

  ingress {
      from_port = 21
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a new instance of the CoreOS ami-03715d51 on an c3.xlarge node with an AWS Tag naming it "vegeta"
resource "aws_instance" "web" {
    ami = "ami-03715d51"
    availability_zone = "ap-southeast-1a"
    instance_type = "c3.xlarge"
    key_name  = "mykeyname"
    tags {
        Name = "vegeta"
    }
    connection {
        user = "core"
        key_file = "${var.key_file}"
    }

provisioner "remote-exec" {
  inline = [
    "docker run -d --name vegeta -it vishnunair/docker-vegeta"
    ] 
  }
}
