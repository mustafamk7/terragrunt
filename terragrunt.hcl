generate "cloud" {
  path      = "cloud.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
    terraform {
      backend "local" {
        path = "${get_terragrunt_dir()}/terraform.tfstate"
      }
    }
  EOF
}

# You no longer need the remote_state block since you're storing state locally

inputs = {
  region = "us-east-1"
}
