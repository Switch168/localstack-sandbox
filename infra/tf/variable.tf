variable "region" {
  description = "The AWS region"
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "The name of the Amazon EKS cluster."
  default     = "my-eks-cluster"
}
