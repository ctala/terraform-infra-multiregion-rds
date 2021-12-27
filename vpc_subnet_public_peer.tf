/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 12:32:26
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-20 09:42:24
 * @ Description: Subnet para los balanceadores de carga del dashboard y sus respectivas
 * asignaciones
 */



# PUBLIC SUBNETS

resource "aws_subnet" "public-2a-peer" {
  provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.1.0/27"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PUB SUBNET 1A"
    Environment = "peer-vpc"
  }
}

resource "aws_subnet" "public-2b-peer" {
   provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.1.32/27"
  availability_zone = "us-east-1b"
  tags = {
    Name = "PUB SUBNET 1B"
    Environment = "peer-vpc"
  }
}
resource "aws_subnet" "public-2c-peer" {
   provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.1.64/27"
  availability_zone = "us-east-1c"
  tags = {
    Name = "PUB SUBNET 1C"
    Environment = "peer-vpc"
  }
}
resource "aws_subnet" "public-2d-peer" {
   provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.1.96/27"
  availability_zone = "us-east-1d"
  tags = {
    Name = "PUB SUBNET 1D"
    Environment = "peer-vpc"
  }
}



resource "aws_route_table_association" "public-2a-peer" {
   provider                  = aws.peer
  subnet_id      = aws_subnet.public-2a-peer.id
  route_table_id = aws_route_table.public-peer.id
}

resource "aws_route_table_association" "public-2b-peer" {
   provider                  = aws.peer
  subnet_id      = aws_subnet.public-2b-peer.id
  route_table_id = aws_route_table.public-peer.id
}

resource "aws_route_table_association" "public-2c-peer" {
   provider                  = aws.peer
  subnet_id      = aws_subnet.public-2c-peer.id
  route_table_id = aws_route_table.public-peer.id
}

resource "aws_route_table_association" "public-2d-peer" {
   provider                  = aws.peer
  subnet_id      = aws_subnet.public-2d-peer.id
  route_table_id = aws_route_table.public-peer.id
}