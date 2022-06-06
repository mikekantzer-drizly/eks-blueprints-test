# module "eks_blueprints_kubernetes_addons" {
#   source = "git@github.com:aws-ia/terraform-aws-eks-blueprints.git//modules/kubernetes-addons?ref=v4.0.8"

#   eks_cluster_id               = module.eks_blueprints.eks_cluster_id
#   eks_cluster_endpoint         = module.eks_blueprints.eks_cluster_endpoint
#   eks_oidc_provider            = module.eks_blueprints.oidc_provider
#   eks_cluster_version          = module.eks_blueprints.eks_cluster_version
#   eks_worker_security_group_id = module.eks_blueprints.worker_node_security_group_id
#   auto_scaling_group_names     = module.eks_blueprints.self_managed_node_group_autoscaling_groups


#   enable_argocd         = true
#   argocd_manage_add_ons = true # Indicates that ArgoCD is responsible for managing/deploying add-ons
#   argocd_applications = {
#     addons = {
#       path               = "chart"
#       repo_url           = "https://github.com/aws-samples/eks-blueprints-add-ons.git"
#       add_on_application = true
#     }
#     workloads = {
#       path               = "envs/dev"
#       repo_url           = "https://github.com/aws-samples/eks-blueprints-workloads.git"
#       add_on_application = false
#     }
#   }

#   # Add-ons
#   enable_aws_for_fluentbit  = true
#   enable_cert_manager       = true
#   enable_cluster_autoscaler = true
#   enable_karpenter          = true
#   enable_keda               = true
#   enable_metrics_server     = true
#   enable_prometheus         = true
#   enable_traefik            = true
#   enable_vpa                = true
#   enable_yunikorn           = true
#   enable_argo_rollouts      = true
# }
