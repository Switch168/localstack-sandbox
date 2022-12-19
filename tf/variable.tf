variable "region" {
  description = "The AWS region"
  default     = "ap-southeast-2"
  # also change in provider.tf
}

variable "cluster_name" {
  description = "The name of the Amazon EKS cluster."
  default     = "toy-eks-cluster"
}
