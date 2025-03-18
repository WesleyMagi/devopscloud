resource "aws_cloudwatch_log_group" "backend_logs" {
  name              = "/ecs/backend-logs"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "frontend_logs" {
  name              = "/ecs/frontend-logs"
  retention_in_days = 7
}