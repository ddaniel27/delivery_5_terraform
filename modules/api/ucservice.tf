# ---------------------------USER CORE SERVICE--------------------------------
resource "aws_apigatewayv2_integration" "eks_user_core" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:488630032666:listener/net/a7a40b9e4eb9c4755857a9356f821e4f/d13a42bc7515daea/64cf261c20da954c"
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
