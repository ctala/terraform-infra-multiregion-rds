/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 10:31:34
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-21 10:48:46
 * @ Description: GENERA EL VPC PRINCIPAL Y UNA SUBNET PRINCIPAL PARA EL NAT.
 * También genera todos los recusos básicos para poder inicializar la plataforma.
 */


# MAIN VPC ON US-WEST-2
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
 

  tags = {
    Name = "multiregion-vpc"
    Environment = "main-vpc"
  }

}


# MAIN PRIVATE IP
resource "aws_eip" "main-eip" {
    vpc                       = true
    tags = {
        Name = "MAIN Private IP For VPC"
        Environment = "main-vpc"
  }
}


# MAIN SUBNET FOR NAT
resource "aws_subnet" "nat-2a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.50.0/27"
  availability_zone = "us-west-2a"
  tags = {
    Name = "NAT PUB SUBNET 2A"
    Environment = "main-vpc"
  }
}


# MAIN INTERNET GATEWAY
resource "aws_internet_gateway" "multiregion-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "multiregion-igw}"
    Environment = "main-vpc"
  }
}


# MAIN ROUTE TABLES FOR NAT
resource "aws_route_table" "main-nat" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multiregion-igw.id
  }

  tags = {
    Name = "DEFAULT ROUTE TABLE FOR NAT"
    Environment = "main-vpc"
  }
}


#MAIN ROUTE TABLE FOR RDS
resource "aws_route_table" "rds" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "RDS ROUTE TABLE"
    Environment = "main-vpc"
  }
}



#MAIN NAT SUBNET ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "main-nat-2a" {
  subnet_id      = aws_subnet.nat-2a.id
  route_table_id = aws_route_table.main-nat.id
}