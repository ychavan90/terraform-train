terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "terraform-train-remote-backend"
    key    = "teffaform.tfstate"
    region = "us-west-2"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07c5ecd8498c59db5"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
