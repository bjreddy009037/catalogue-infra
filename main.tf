module "vpc" {
  source = "github.com/bjreddy009037/tf-module-vpc"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT = var.COMPONENT
  ENV = var.ENV
  AZ = var.AZ
  SUBNET_CIDR = var.SUBNET_CIDR
}

module "documentdb" {
  depends_on          = [module.vpc]
  source              = "github.com/bjreddy009037/tf-module-documentdb"
  ENGINE              = var.DOCDB_ENGINE
  ENGINE_VERSION      = var.DOCDB_ENGINE_VERSION
  NODE_TYPE           = var.DOCDB_NODE_TYPE
  ENV                 = var.ENV
  COMPONENT           = var.COMPONENT
  NODE_COUNT          = var.DOCDB_NODE_COUNT
  FAMILY              = var.DOCDB_FAMILY
  SKIP_FINAL_SNAPSHOT = var.DOCDB_SKIP_FINAL_SNAPSHOT
  VPC_ID = module.vpc.VPC_ID
  VPC_CIDR = module.vpc.VPC_CIDR
  SUBNET_IDS = module.vpc.SUBNET_IDS
}