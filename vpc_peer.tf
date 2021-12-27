/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 10:31:34
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-21 10:48:46
 * @ Description: GENERA EL VPC PRINCIPAL Y UNA SUBNET PRINCIPAL PARA EL NAT.
 * También genera todos los recusos básicos para poder inicializar la plataforma.
 */


# PEER VPC ON US-EAST-1
resource "aws_vpc" "peer" {
  provider  = aws.peer
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
 

  tags = {
    Name = "multiregion-vpc-peer"
    Environment = "peer-vpc"
  }

}


# peer PRIVATE IP
resource "aws_eip" "peer-eip" {
    provider  = aws.peer
    vpc                       = true
    tags = {
        Name = "peer PEER Private IP For VPC"
        Environment = "peer-vpc"
  }
}


# peer SUBNET FOR NAT
resource "aws_subnet" "nat-2a-peer" {
  provider  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.50.0/27"
  availability_zone = "us-east-1a"
  tags = {
    Name = "NAT PUB SUBNET 1A"
    Environment = "peer-vpc"
  }
}

# peer INTERNET GATEWAY
resource "aws_internet_gateway" "multiregion-igw-peer" {
  provider  = aws.peer
  vpc_id = aws_vpc.peer.id

  tags = {
    Name = "multiregion-igw-peer"
    Environment = "peer-vpc"
  }
}


# peer ROUTE TABLES FOR NAT
resource "aws_route_table" "peer-nat" {
  provider  = aws.peer
  vpc_id = aws_vpc.peer.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multiregion-igw-peer.id
  }

  tags = {
    Name = "DEFAULT ROUTE TABLE FOR NAT"
    Environment = "peer-vpc"
  }
}


#peer ROUTE TABLE FOR RDS
resource "aws_route_table" "peer-rds" {
  provider  = aws.peer
  vpc_id = aws_vpc.peer.id

  tags = {
    Name = "RDS ROUTE TABLE"
    Environment = "peer-vpc"
  }
}



#peer NAT SUBNET ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "peer-nat-2a" {
  provider  = aws.peer
  subnet_id      = aws_subnet.nat-2a-peer.id
  route_table_id = aws_route_table.peer-nat.id
}