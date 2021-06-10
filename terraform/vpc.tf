resource "aws_vpc" "main-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}



resource "aws_subnet" "public-sub-1" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr1
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public-sub-2" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr2
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public-sub-3" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr3
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public-sub-4" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr4
  tags = {
    Name = "public-subnet"
  }
}
