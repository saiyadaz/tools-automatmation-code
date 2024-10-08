variable "tools" {
  default = {
    prometheus = {
      instance_type        = "t3.micro"
      policy_resource_list = ["ec2:DescribeInstances"]
    }
  }
}

variable "zone_id" {
  default = "Z0599937U1I5C34JZJE7"
}

