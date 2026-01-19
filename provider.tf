terraform {
  backend "s3" {
    bucket = "polaris-backend"
    key    = "polarisbasics/basics.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}



provider "aws" {
  region = "ap-south-1"
}
