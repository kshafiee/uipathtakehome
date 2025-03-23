resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name                         = "eks-private-subnet-1"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name                         = "eks-private-subnet-2"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name              = "eks-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name              = "eks-public-subnet-2"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-internet-gateway"
  }
}

resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.eks_nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "eks-nat-gateway"
  }
}

resource "aws_eip" "eks_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "eks-nat-eip"
  }
}

