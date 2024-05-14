resource "aws_db_subnet_group" "Database_Subnets" {
  name        = "database subnets"
  subnet_ids  = [aws_subnet.tf_pvt3.id, aws_subnet.tf_pvt4.id]
  description = "Subnet group for database instance"

  tags = {
    Name = "Database_Subnets"
  }
}

resource "aws_db_instance" "tf_database" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.tf_database
  db_name                = "tf_database"
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  availability_zone      = "us-east-1a"
  db_subnet_group_name   = aws_db_subnet_group.Database_Subnets.id  # Corrected reference to ID
  multi_az               = var.multi_az_deployment
  vpc_security_group_ids = [aws_security_group.DB_sg.id]

  tags = {
    Name = "tf_database_atlantis"
  }
}
