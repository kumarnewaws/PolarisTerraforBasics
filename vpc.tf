resource "aws_vpc" "DemoVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_internet_gateway" "DemoIGW" {
  vpc_id = aws_vpc.DemoVPC.id
  tags = {
    "Name" = "Polaris-IGW"
  }
  depends_on = [ aws_vpc.DemoVPC ]
}

resource "aws_subnet" "Demo_Subnet_1" {
  vpc_id                  = aws_vpc.DemoVPC.id
  cidr_block              = var.subnet_cidr_1
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Polaris-Subnet-1"
  }
  depends_on = [ aws_internet_gateway.DemoIGW ]
}

resource "aws_subnet" "Demo_Subnet_2" {
  vpc_id                  = aws_vpc.DemoVPC.id
  cidr_block              = var.subnet_cidr_2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Polaris-Subnet-2"
  }
  depends_on = [ aws_subnet.Demo_Subnet_1 ]
}

resource "aws_subnet" "Demo_Subnet_3" {
  vpc_id                  = aws_vpc.DemoVPC.id
  cidr_block              = var.subnet_cidr_3
  availability_zone       = var.az3
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Polaris-Subnet-3"
  }
  depends_on = [ aws_subnet.Demo_Subnet_2 ]
  lifecycle {
    create_before_destroy = true
  }
}