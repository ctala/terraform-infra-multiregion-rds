/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-20 10:39:04
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-21 10:46:31
 * @ Description: Subnets privadas que serán usadas por el Gateway
 * mientras sea en base a Elastic Beanstalk  u otro tipo de instancias
 */




# SUBNETS PARA LOS BALANCEADORES DE CARGA DEL GW

resource "aws_subnet" "private-1a" {
  provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PRIV SUBNET 1A"
    Environment = "main-vpc"
  }
}

resource "aws_subnet" "private-1b" {
  provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.6.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "PRIV SUBNET 1B"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "private-1c" {
  provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.7.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "PRIV SUBNET 1C"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "private-1d" {
  provider                  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.8.0/24"
  availability_zone = "us-east-1d"
  tags = {
    Name = "PRIV SUBNET 1D"
    Environment = "main-vpc"
  }
}



resource "aws_route_table_association" "private-1a" {
  provider                  = aws.peer
  subnet_id      = aws_subnet.private-1a.id
  route_table_id = aws_route_table.peer-nat.id
}

resource "aws_route_table_association" "private-1b" {
  provider                  = aws.peer
  subnet_id      = aws_subnet.private-1b.id
  route_table_id = aws_route_table.peer-nat.id
}

resource "aws_route_table_association" "private-1c" {
  provider                  = aws.peer
  subnet_id      = aws_subnet.private-1c.id
  route_table_id = aws_route_table.peer-nat.id
}

resource "aws_route_table_association" "private-1d" {
  provider                  = aws.peer
  subnet_id      = aws_subnet.private-1d.id
  route_table_id = aws_route_table.peer-nat.id
}