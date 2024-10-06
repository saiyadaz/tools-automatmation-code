terraform {
  backend "s3" {
    bucket="devops-tf-states-sz"
    key   ="tools/state"
    region="us-east-1"
  }
}