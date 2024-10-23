terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.14.0"
}

inputs = {
  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  single_nat_gateway = true

  tags = {
    Name = "dev-vpc"
  }
}

