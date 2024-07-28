# Define the provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Define the EKS cluster and managed node groups
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 18.0"  # Adjust to the latest version if needed
  cluster_name    = "example-cluster"
  cluster_version = "1.21"
  vpc_id           = aws_vpc.example.id
  subnets         = [aws_subnet.example.id]

  node_groups = {
    node_group_one = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.small"]
    }
    node_group_two = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_types   = ["t3.small"]
    }
  }
}

# Outputs to verify resources
output "vpc_id" {
  value = aws_vpc.example.id
}

output "subnet_id" {
  value = aws_subnet.example.id
}

output "cluster_name" {
  value = module.eks.cluster_name
}
