# using providers.tf is to group all the providers like aws and tools you are using
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  region     = local.region
}

