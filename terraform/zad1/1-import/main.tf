terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"

}

resource "aws_instance" "web" {
  // AMI ID moze byc rozne w roznych regionach
  ami           = "ami-0669b163befffbdfc"
  instance_type = "t2.micro"
}