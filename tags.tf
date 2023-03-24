data "aws_default_tags" "provider" {}

locals {
  tags = {
    for k, v in module.this.tags : k => v if lookup(data.aws_default_tags.provider.tags, k, null) == null || lookup(data.aws_default_tags.provider.tags, k, null) != v
  }
}
