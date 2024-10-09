variable "tools" {
  default = {
    prometheus = {
      instance_type        = "t3.micro"
      policy_resource_list = ["ec2:DescribeInstances"]
    }
  }

  jenkins = {
    instance_type        = "t3.large"
    policy_resource_list = []
  }
}

variable "zone_id" {
  default = "Z0599937U1I5C34JZJE7"
}

