resource "aws_instance" "instance" {
  ami                   = data.aws_ami.ami.image_id
  instance_type         = var.instance_type
  vpc_security_group_ids= [data.aws_security_group.selected.id]
  iam_instance_profile = "aws_iam_instance_profile.instance_profile.name"

 tags = {
   Name= var.tool_name
 }
}

resource "aws_route53_record" "record" {
  name    = var.tool_name
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.instance.public_ip]
  ttl     = 3

}
resource "aws_iam_role" "role" {
  name = "${var.tool_name}-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.tool_name}-role"
  }
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.tool_name}-role"
  role = aws_iam_role.role.name
}
