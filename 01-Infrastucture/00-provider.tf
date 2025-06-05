terraform {
  required_providers {
    # aws provider
    #===============
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }

    
  }
}

provider "aws" {
  # Configuration options
  region = var.region



}