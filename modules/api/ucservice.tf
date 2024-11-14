# ---------------------------USER CORE SERVICE--------------------------------
resource "aws_apigatewayv2_integration" "eks_user_core" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:488630032666:listener/net/ad8b2f0f5a68c443dbbaf019b2b183d9/87d15f5926d17689/8443f05807da8a1f"
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.eks.id
}

resource "aws_apigatewayv2_route" "get_users" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  route_key = "ANY /user/{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.eks_user_core.id}"
}

resource "aws_apigatewayv2_route" "post_users" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  route_key = "POST /user"
  target    = "integrations/${aws_apigatewayv2_integration.eks_user_core.id}"
}
