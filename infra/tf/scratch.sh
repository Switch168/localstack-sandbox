#!/bin/bash

terraform init
terraform plan
# terraform apply

# provisioning flow
terraform apply -target=module.vpc
terraform apply -target aws_iam_role.eks_cluster
terraform apply -target aws_iam_role_policy_attachment.policy-AmazonEKSClusterPolicy
terraform apply -target aws_iam_role_policy_attachment.policy-AmazonEKSVPCResourceController
terraform apply -target aws_cloudwatch_log_group.eks_cluster_control_plane_components
terraform apply -target aws_eks_cluster.cluster