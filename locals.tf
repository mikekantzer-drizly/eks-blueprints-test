locals {
  name   = "eks-blueprints-test"
  region = "us-east-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  # tags = {
  #   Blueprint  = local.name
  #   GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  # }
}

data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}