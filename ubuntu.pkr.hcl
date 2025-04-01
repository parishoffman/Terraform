packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "learn-packer-ubuntu-aws"
  instance_type = "t4g.micro"
  region        = "us-east-1"
  source_ami = "ami-0c4e709339fa8521a"
  ssh_username = "ubuntu"
}

build {
  name = "packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]


  provisioner "shell" {
    inline = [
      "sudo add-apt-repository ppa:deadsnakes/ppa -y",
      "sudo apt-get update -y",
      "sudo apt-get install python3.11 -y",
    ]
  }
}

