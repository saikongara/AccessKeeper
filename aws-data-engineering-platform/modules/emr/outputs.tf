output "emr_cluster_id" {
  description = "The ID of the EMR cluster created."
  value       = aws_emr_cluster.data_engineering_cluster.id
}

output "emr_cluster_endpoint" {
  description = "The endpoint of the EMR cluster."
  value       = aws_emr_cluster.data_engineering_cluster.endpoint
}

output "emr_cluster_master_public_dns" {
  description = "The public DNS of the master node of the EMR cluster."
  value       = aws_emr_cluster.data_engineering_cluster.master_public_dns
}

output "emr_instance_group_ids" {
  description = "The IDs of the instance groups in the EMR cluster."
  value       = aws_emr_instance_group.example.*.id
}