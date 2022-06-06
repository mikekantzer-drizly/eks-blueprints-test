terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "DrizlyInc"
    workspaces {
      # name = "eks-blueprints-test"
      tags = [
        "repo:eks-blueprints-test",
        "repo-owner:mikekantzer-drizly",
        "type:k8s-cluster",
        "PROOF-OF-CONCEPT"
      ]
    }
  }

}

provider "aws" {
  region              = local.region
  allowed_account_ids = ["846469280661"]
  default_tags {
    tags = {
      cluster   = local.name
      workspace = terraform.workspace
      repo      = "mikekantzer-drizly/eks-blueprint-test"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks_blueprints.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_blueprints.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
    }
  }
}