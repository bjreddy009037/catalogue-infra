module "vpc" {
  source = "github.com/bjreddy009037/tf-module-vpc"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT = var.COMPONENT
  ENV = var.ENV
  AZ = var.AZ
  SUBNET_CIDR = var.SUBNET_CIDR
}

module "documentdb" {
  depends_on = [module.vpc]
  source = "github.com/bjreddy009037/tf-module-documentdb"
  ENGINE = var.ENGINE
  ENGINE_VERSION = var.ENGINE_VERSION
  NODE_TYPE = var.NODE_TYPE
  ENV = var.ENV
  COMPONENT = var.COMPONENT
  NODE_COUNT = var.NODE_COUNT
  FAMILY = var.FAMILY
  SKIP_FINAL_SNAPSHOT = var.SKIP_FINAL_SNAPSHOT
