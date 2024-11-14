# ------------------------------PROJECT CORE SERVICE----------------------------
resource "aws_apigatewayv2_integration" "eks_project_core" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:488630032666:listener/net/a51de8b07b9df407496a4ad7938f46e0/db9684308e8e2619/05f2c753679a292f"
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.eks.id
}

resource "aws_apigatewayv2_route" "get_projects" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  route_key = "ANY /project/{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.eks_project_core.id}"
}

resource "aws_apigatewayv2_route" "post_projects" {
  api_id = aws_apigatewayv2_api.csbe_api.id

  route_key = "POST /project"
  target    = "integrations/${aws_apigatewayv2_integration.eks_project_core.id}"
}
