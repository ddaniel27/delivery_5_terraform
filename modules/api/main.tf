resource "aws_apigatewayv2_api" "csbe_api" {
  name          = "csbe-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "csbe_api_stage" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  name   = "api"
  auto_deploy = true
}

resource "aws_security_group" "vpc_link" {
  name   = "vpc-link"
  vpc_id = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_apigatewayv2_vpc_link" "eks" {
  name               = "eks"
  security_group_ids = [aws_security_group.vpc_link.id]
  subnet_ids = var.subnet_ids
}
