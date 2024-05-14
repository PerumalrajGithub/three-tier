resource "aws_lb_target_group" "alb_tg" {
    name     = "ApplicationLB"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.TF_VPC.id
    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 10
      matcher = 200
      path = "/"
      port = "traffic-port"
      protocol = "HTTP"
      timeout = 3
      unhealthy_threshold = 2
    }
}
resource "aws_lb_target_group_attachment" "tg-attach1" {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    target_id = aws_instance.pub_instnce.id
    port = 8080
}
resource "aws_lb_target_group_attachment" "tg-attach2" {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    target_id = aws_instance.pvt_instnce_1.id
    port = 8080
}
resource "aws_lb_target_group_attachment" "tg-attach3" {
    target_group_arn = aws_lb_target_group.alb_tg.arn
    target_id = aws_instance.pvt_instnce_2.id
    port = 8080
}
resource "aws_alb" "alb_tg" {
  name = "albtg"
  internal = false
  load_balancer_type = "application"
  security_groups = ["${aws_security_group.alb_sg.id}"]
  subnets = [ "${aws_subnet.tf_pub1.id}", "${aws_subnet.tf_pub2.id}" ]
  enable_deletion_protection = false
  tags ={
    Environment = "albtg"
  }
}
resource "aws_alb_listener" "alb_listener" {
    load_balancer_arn = aws_alb.alb_tg.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb_tg.arn
    }
}
