# ------------------------------PROJECT CORE SERVICE----------------------------
# resource "aws_api_gateway_resource" "projects_resource" {
#   rest_api_id = aws_api_gateway_rest_api.api_gateway.id
#   parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
#   path_part   = "projects"
# }
# 
# resource "aws_api_gateway_method" "get_projects" {
#   rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
#   resource_id   = aws_api_gateway_resource.projects_resource.id
#   http_method   = "GET"
#   authorization = "NONE"
# }
# 
# resource "aws_api_gateway_integration" "pc_service_integration" {
#   rest_api_id = aws_api_gateway_rest_api.api_gateway.id
#   resource_id = aws_api_gateway_resource.projects_resource.id
#   http_method = aws_api_gateway_method.get_projects.http_method
#   type        = "HTTP_PROXY"
#   uri         = "http://pc-service.default.svc.cluster.local"
# }
# 
# resource "aws_api_gateway_method_response" "get_projects_method_response" {
#   rest_api_id = aws_api_gateway_rest_api.api_gateway.id
#   resource_id = aws_api_gateway_resource.projects_resource.id
#   http_method = aws_api_gateway_method.get_projects.http_method
#   status_code = "200"
# }
# 
# resource "aws_api_gateway_integration_response" "get_projects_integration_response" {
#   rest_api_id = aws_api_gateway_rest_api.api_gateway.id
#   resource_id = aws_api_gateway_resource.projects_resource.id
#   http_method = aws_api_gateway_method.get_projects.http_method
#   status_code = "200"
#   response_templates = {
#     "application/json" = ""
#   }
# }
