/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 12:32:26
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-20 09:42:24
 * @ Description: Subnet para los balanceadores de carga del dashboard y sus respectivas
 * asignaciones
 */



# PUBLIC SUBNETS

resource "aws_subnet" "public-2a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/27"
  availability_zone = "us-west-2a"
  tags = {
    Name = "PUB SUBNET 2A"
    Environment = "main-vpc"
  }
}

resource "aws_subnet" "public-2b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.32/27"
  availability_zone = "us-west-2b"
  tags = {
    Name = "PUB SUBNET 2B"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "public-2c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.64/27"
  availability_zone = "us-west-2c"
  tags = {
    Name = "PUB SUBNET 2C"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "public-2d" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.96/27"
  availability_zone = "us-west-2d"
  tags = {
    Name = "PUB SUBNET 2D"
    Environment = "main-vpc"
  }
}



resource "aws_route_table_association" "public-2a" {
  subnet_id      = aws_subnet.public-2a.id
  route_table_id = aws_route_table.public-main.id
}

resource "aws_route_table_association" "public-2b" {
  subnet_id      = aws_subnet.public-2b.id
  route_table_id = aws_route_table.public-main.id
}

resource "aws_route_table_association" "public-2c" {
  subnet_id      = aws_subnet.public-2c.id
  route_table_id = aws_route_table.public-main.id
}

resource "aws_route_table_association" "public-2d" {
  subnet_id      = aws_subnet.public-2d.id
  route_table_id = aws_route_table.public-main.id
}