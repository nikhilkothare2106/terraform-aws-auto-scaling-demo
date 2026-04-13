resource "aws_launch_template" "hello_lt" {
  name_prefix   = "hello-lt-"
  description   = "Basic launch template"
  image_id      = var.ami_id
  instance_type = "t3.micro"

  iam_instance_profile {
    name = "SSM-EC2-Role"
  }

  vpc_security_group_ids = [var.private_sg_id]

  user_data = filebase64("${path.module}/user_data_hello.sh")
}

resource "aws_launch_template" "hi_lt" {
  name_prefix   = "hi-lt-"
  description   = "Basic launch template"
  image_id      = var.ami_id
  instance_type = "t3.small"

  iam_instance_profile {
    name = "SSM-EC2-Role"
  }

  vpc_security_group_ids = [var.private_sg_id]

  user_data = filebase64("${path.module}/user_data_hi.sh")
  tags = {
    Name = "template-hi"
  }
}