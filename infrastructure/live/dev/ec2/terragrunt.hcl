terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=5.7.1"
}

dependency "security_group" {
  config_path = "../security_group"  # Path to your security group module
}

dependency "vpc" {
  config_path = "../vpc"  # Path to your VPC module
}

inputs = {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t3.micro"
  key_name      = "ubuntu-key"

  vpc_security_group_ids = ["${dependency.security_group.outputs.security_group_id}"]
  subnet_id              = "${dependency.vpc.outputs.public_subnets[0]}"

  tags = {
    Environment = "dev"
    Name        = "dev-instance"
  }
}
