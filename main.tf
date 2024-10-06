module "tools" {
  for_each = var.tools
  source = "./module"

  tool_name= each.key
  instance_type= each.key["instance_type"]
  zone_id = var.zone_id
}
#variable "tools" {
#default = {
  #prometheus = {
   # instance_type = "t3.micro"
  #}
#}
#}
