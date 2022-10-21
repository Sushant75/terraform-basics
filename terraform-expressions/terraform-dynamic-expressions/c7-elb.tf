# AWS ELB

resource "aws_elb" "elb" {
  name  = "my-elb"
  count = (var.high_availability == true ? 1 : 0)
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = aws_instance.my-ec2-vm[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  availability_zones          = var.availability_zone
  tags                        = local.common_tags
}