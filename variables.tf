variable "tools" {
  default = {
    prometheus = {
      instance_type        = "t3.micro"
      policy_resource_list = ["ec2:DescribeInstances"]
    }



    jenkins = {
      instance_type        = "t3.small"
      policy_resource_list = []
  }

    vault = {
      instance_type        = "t3.small"
     #policy_resource_list = []


    variable  "zone_id" {
      default = "Z02385991VFZVIKN8WPK8"
    }

    }
}

