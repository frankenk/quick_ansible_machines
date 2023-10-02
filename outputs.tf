output "ec2_instance_id" {
  description = "Outputs instance IDs"
  value       = [for i in aws_instance.ansible_nodes: i.id]
}

output "ec2_instance_ips" {
  description = "Outputs instance IPs"
  value       = [for i in aws_instance.ansible_nodes: i.public_ip]
}