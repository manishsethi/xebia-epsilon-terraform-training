# uauth target group

resource "aws_lb_target_group" "uauth" {
  name               = "${var.prefix}-uauth-443"
  port               = 80
  protocol           = "80"
  protocol_version   = "HTTP1"
  vpc_id             = var.vpc_primary_id
  tags               = local.tags
  health_check {
    protocol            = "80"
    enabled             = true
    healthy_threshold   = local.healthy_threshold
    path                = local.path
    port                = 80
    unhealthy_threshold = local.unhealthy_threshold
    interval            = local.interval
  }
  deregistration_delay = 65
  slow_start           = 60
}

# uauth Application LB

resource "aws_lb" "uauth" {
  name                       = "${var.prefix}-uauth"
  load_balancer_type         = "application"
  subnets                    = [data.aws_subnet.archimedes_primary_public_a,data.aws_subnet.archimedes_primary_public_b,data.aws_subnet.archimedes_primary_public_c]
  security_groups            = "${var.alb_security_groups}"
  enable_deletion_protection = true


  access_logs {
    bucket = "${var.alb_bucketname}"
    enabled = true
  }
  tags = local.tags
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.uauth.arn
  port              = "80"
  protocol          = "HTTP"
}
