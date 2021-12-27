/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 10:50:58
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-20 11:09:45
 * @ Description: Subnet para la base de datos principal.
 * Al momento del script 2d no está soportado.
 */



#SUBNET 2A para Bases de dato RDS
resource "aws_subnet" "rds-2a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/27"
  availability_zone = "us-west-2a"
  tags = {
    Name = "RDS SUBNET 2A"
    Environment = "main-vpc"
  }
}

resource "aws_subnet" "rds-2b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.32/27"
  availability_zone = "us-west-2b"
  tags = {
    Name = "RDS SUBNET 2B"
    Environment = "main-vpc"
  }
}
resource "aws_subnet" "rds-2c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.64/27"
  availability_zone = "us-west-2c"
  tags = {
    Name = "RDS SUBNET 2C"
    Environment = "main-vpc"
  }
}



resource "aws_route_table_association" "rds-2a" {
  subnet_id      = aws_subnet.rds-2a.id
  route_table_id = aws_route_table.rds.id
}

resource "aws_route_table_association" "rds-2b" {
  subnet_id      = aws_subnet.rds-2b.id
  route_table_id = aws_route_table.rds.id
}

resource "aws_route_table_association" "rds-2c" {
  subnet_id      = aws_subnet.rds-2c.id
  route_table_id = aws_route_table.rds.id
}



resource "aws_db_subnet_group" "default_db_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.rds-2a.id, aws_subnet.rds-2b.id,aws_subnet.rds-2c.id]

  tags = {
    Name = "Default DB subnet group"
  }
}