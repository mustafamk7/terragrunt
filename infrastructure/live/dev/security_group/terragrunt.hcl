terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=5.2.0"
}

dependency "vpc" {
  config_path = "../vpc" 
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs = {
    vpc_id = "vpc-04e3e1e302f8c8f06"
  } 
  mock_outputs_merge_strategy_with_state = "shallow"
}

inputs = {
  vpc_id = "${dependency.vpc.outputs.vpc_id}"
  name = "dev-security-group"
  
  ingress_with_cidr_blocks = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Service ports (ipv4). All"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Service ports (ipv4). All"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      rule        = "all-tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Environment = "dev"
    Name        = "dev-security-group"
  }
}

