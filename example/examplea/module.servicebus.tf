module "servicebus" {
  source      = "../../"
  tags = var.common_tags
  rg_name="pike"
  location="uksouth"
}
