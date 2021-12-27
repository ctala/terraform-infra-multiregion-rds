/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-20 10:39:04
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-21 10:46:31
 * @ Description: Subnets privadas que serán usadas por el Gateway
 * mientras sea en base a Elastic Beanstalk  u otro tipo de instancias
 */




# SUBNETS PARA LOS BALANCEADORES DE CARGA DEL GW

resource "aws_subnet" "private-2a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "PRIV SUBNET 2A"
    Environment = "main-vpc"
  }
}

resource "aws_subnet" "private-2b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "PRIV SUBNET 2B"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "private-2c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.7.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "PRIV SUBNET 2C"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "private-2d" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.8.0/24"
  availability_zone = "us-west-2d"
  tags = {
    Name = "PRIV SUBNET 2D"
    Environment = "main-vpc"
  }
}



resource "aws_route_table_association" "private-2a" {
  subnet_id      = aws_subnet.private-2a.id
  route_table_id = aws_route_table.main-nat.id
}

resource "aws_route_table_association" "private-2b" {
  subnet_id      = aws_subnet.private-2b.id
  route_table_id = aws_route_table.main-nat.id
}

resource "aws_route_table_association" "private-2c" {
  subnet_id      = aws_subnet.private-2c.id
  route_table_id = aws_route_table.main-nat.id
}

resource "aws_route_table_association" "private-2d" {
  subnet_id      = aws_subnet.private-2d.id
  route_table_id = aws_route_table.main-nat.id
}