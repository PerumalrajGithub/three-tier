# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.TF_VPC.id
}

# Output the Internet Gateway ID
output "igw_id" {
  value = aws_internet_gateway.TF_igw.id
}

# Output the NAT Gateway ID
output "nat_id" {
  value = aws_nat_gateway.tf_NAT.id
}

# Output the Public Route Table ID
output "pub_rt_id" {
  value = aws_route_table.tf_pubrt.id
}

# Output the Private Route Table ID
output "pvt_rt_id" {
  value = aws_route_table.tf_pvtrt.id
}

# Output the Public Subnet IDs
output "pub_subnet_ids" {
  value = [
    aws_subnet.tf_pub1.id,
    aws_subnet.tf_pub2.id
  ]
}

# Output the Private Subnet IDs
output "pvt_subnet_ids" {
  value = [
    aws_subnet.tf_pvt1.id,
    aws_subnet.tf_pvt2.id,
    aws_subnet.tf_pvt3.id,
    aws_subnet.tf_pvt4.id
  ]
}
# Output the ALB Security Group ID
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

# Output the Bastion Security Group ID
output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

# Output the EC2 Security Group ID
output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

# Output the Database Security Group ID
output "db_sg_id" {
  value = aws_security_group.DB_sg.id
}
# Output the Public Instance ID
output "pub_instance_id" {
  value = aws_instance.pub_instnce.id
}

# Output the Private Instance 1 ID
output "pvt_instance_1_id" {
  value = aws_instance.pvt_instnce_1.id
}

# Output the Private Instance 2 ID
output "pvt_instance_2_id" {
  value = aws_instance.pvt_instnce_2.id
}
# Output the Application Load Balancer (ALB) ID
output "alb_id" {
  value = aws_alb.alb_tg.id
}

# Output the ALB DNS Name
output "alb_dns_name" {
  value = aws_alb.alb_tg.dns_name
}

# Output the ALB Target Group ID
output "alb_tg_id" {
  value = aws_lb_target_group.alb_tg.id
}

# Output the Target Group Attachments
output "target_group_attachments" {
  value = [
    aws_lb_target_group_attachment.tg-attach1.id,
    aws_lb_target_group_attachment.tg-attach2.id,
    aws_lb_target_group_attachment.tg-attach3.id
  ]
}
# Output the RDS Database Instance ID
output "rds_instance_id" {
  value = aws_db_instance.tf_database.id
}

# Output the RDS Database Endpoint
output "rds_instance_endpoint" {
  value = aws_db_instance.tf_database.endpoint
}

# Output the DB Subnet Group ID
output "db_subnet_group_id" {
  value = aws_db_subnet_group.Database_Subnets.id
}
