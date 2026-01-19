terraform {
  backend "s3" {
    bucket = "polaris-backend"
    key    = "polarisbasics/basics.tfstate"
    region = "ap-south-1"
  }
}



provider "aws" {
  region = "ap-south-1"

}
