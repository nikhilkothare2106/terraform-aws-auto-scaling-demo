output "hello_lt" {
  value       = aws_launch_template.hello_lt.id
  description = "Id of hello Launch Template"
}

output "hi_lt" {
  value       = aws_launch_template.hi_lt.id
  description = "Id of hi Launch Template"
}