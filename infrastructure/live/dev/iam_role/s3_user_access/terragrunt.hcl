terraform {
  source = "tfr:///terraform-aws-modules/iam/aws//modules/iam-user?version=5.47.1"
}


dependency "policy" {
  config_path = "../s3_bucket_access_policy"  
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]
  mock_outputs = {
    policy_arn = "arn:aws:iam::123456789012:policy/mock-policy"
  }
  mock_outputs_merge_strategy_with_state = "shallow"
}

inputs = {
  name = "bucket-user"
  create_iam_user_login_profile = false
  force_destroy = true
  policy_arns = [dependency.policy.outputs.arn]
}
