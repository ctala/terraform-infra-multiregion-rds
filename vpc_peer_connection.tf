data "aws_caller_identity" "current" {}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "main-2-peer" {
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = aws_vpc.peer.id
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
  peer_region   = "us-east-1"
  auto_accept   = false

  tags = {
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer
  vpc_peering_connection_id = "${aws_vpc_peering_connection.main-2-peer.id}"
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}     