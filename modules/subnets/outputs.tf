output "csbe_subnet_1_id" {
  value = aws_subnet.csbe_subnet_1.id
}

output "csbe_subnet_2_id" {
  value = aws_subnet.csbe_subnet_2.id
}

output "csbe_subnet_ids" {
  value = [aws_subnet.csbe_subnet_1.id, aws_subnet.csbe_subnet_2.id]
}