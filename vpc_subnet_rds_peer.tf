/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 10:50:58
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-20 11:09:45
 * @ Description: Subnet para la base de datos principal.
 * Al momento del script 2d no está soportado.
 */



#SUBNET 1A para Bases de dato RDS
resource "aws_subnet" "rds-1a-peer" {
  provider  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.0.0/27"
  availability_zone = "us-east-1a"
  tags = {
    Name = "RDS SUBNET 1A"
    Environment = "peer-vpc"
  }
}

resource "aws_subnet" "rds-1b-peer" {
  provider  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.0.32/27"
  availability_zone = "us-east-1b"
  tags = {
    Name = "RDS SUBNET 1B"
    Environment = "peer-vpc"
  }
}
resource "aws_subnet" "rds-1c-peer" {
  provider  = aws.peer
  vpc_id     = aws_vpc.peer.id
  cidr_block = "10.1.0.64/27"
  availability_zone = "us-east-1c"
  tags = {
    Name = "RDS SUBNET 1C"
    Environment = "peer-vpc"
  }
}



resource "aws_route_table_association" "rds-1a-peer" {
  provider  = aws.peer
  subnet_id      = aws_subnet.rds-1a-peer.id
  route_table_id = aws_route_table.peer-rds.id
}

resource "aws_route_table_association" "rds-1b-peer" {
  provider  = aws.peer
  subnet_id      = aws_subnet.rds-1b-peer.id
  route_table_id = aws_route_table.peer-rds.id
}

resource "aws_route_table_association" "rds-1c-peer" {
  provider  = aws.peer
  subnet_id      = aws_subnet.rds-1c-peer.id
  route_table_id = aws_route_table.peer-rds.id
}



resource "aws_db_subnet_group" "default_db_subnet_group-peer" {
  provider  = aws.peer
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.rds-1a-peer.id, aws_subnet.rds-1b-peer.id,aws_subnet.rds-1c-peer.id]

  tags = {
    Name = "Default DB subnet group"
  }
}