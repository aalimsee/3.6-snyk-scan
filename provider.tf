terraform {
  required_version = ">= 1.5.0" # Warning - terraform "required_version" attribute is required (terraform_required_version)
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive" # Missing provider version constraint
      version = "~> 2.4"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


