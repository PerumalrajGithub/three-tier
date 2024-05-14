resource "aws_instance" "pub_instnce" {
  ami                    = "ami-0f30a9c3a48f3fa79"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tf_pub1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = "prjohio"


  tags = {
    Name = "pub_instnce"
  }
}

resource "aws_instance" "pvt_instnce_1" {
  ami                    = "ami-0f30a9c3a48f3fa79"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tf_pvt1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "prjohio"


  tags = {
    Name = "pvt_instnc_1"
  }
}

resource "aws_instance" "pvt_instnce_2" {
  ami                    = "ami-0f30a9c3a48f3fa79"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tf_pvt1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "prjohio"


  tags = {
    Name = "pvt_instnce_2"
  }
}
