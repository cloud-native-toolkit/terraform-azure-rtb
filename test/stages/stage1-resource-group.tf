module "resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-azure-resource-group"

  resource_group_name = "${local.name_prefix}-rg"
  region              = var.region
}
