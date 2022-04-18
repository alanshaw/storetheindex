module "pl_grafana_user" {
  source  = "registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-user"
  version = "4.18.0"

  name = "pl-grafana"

  path = local.iam_path

  # Base64 encoded GPG public key used to encrypt the password and secret access key of pl-grafana user.
  # The private key is stored at `storetheidnex` 1Password vault.
  pgp_key = "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"

  password_reset_required = false
  create_iam_access_key   = true

  tags = local.tags
}

module "metrics_reader_group" {
  source  = "registry.terraform.io/terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "4.18.0"

  name        = "metrics_viewer"
  group_users = [
    module.pl_grafana_user.iam_user_name
  ]

  create_group                      = true
  attach_iam_self_management_policy = false

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonPrometheusQueryAccess",
  ]
}
