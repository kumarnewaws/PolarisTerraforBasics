resource "aws_route_table" "DemoPublicRoute" {
  vpc_id = aws_vpc.DemoVPC.id
  tags = {
    "Name" = "Polaris-Public-RTB"
  }
  route {
    gateway_id = aws_internet_gateway.DemoIGW.id
    cidr_block = "0.0.0.0/0"
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
