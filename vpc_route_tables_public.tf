/**
 * @ Author: Cristian Tala Sánchez
 * @ Create Time: 2020-06-19 13:23:42
 * @ Modified by: Cristian Tala Sánchez
 * @ Modified time: 2020-06-20 10:33:52
 * @ Description: Routing Tables para los balanceadores de carga 
 (Acceso Internet)
 */




resource "aws_route_table" "public-main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multiregion-igw.id
  }

  tags = {
    Name = "ELB DASHBOARD ROUTE TABLE"
    Environment = terraform.workspace
  }
}

resource "aws_route_table" "public-peer" {
  provider                  = aws.peer
  vpc_id = aws_vpc.peer.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.multiregion-igw-peer.id
  }

  tags = {
    Name = "ELB DASHBOARD ROUTE TABLE"
    Environment = terraform.workspace
  }
}