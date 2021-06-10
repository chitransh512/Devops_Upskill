variable "AWS_REGION" {
    type        = string
    default     = "us-east-2"
}

variable "my_VPC_CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/26"
}

variable "my_VPC_PUBLIC_SUBNET1_CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.16/28"
}

variable "my_VPC_PUBLIC_SUBNET2_CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/28"
}

variable "my_VPC_PRIVATE_SUBNET1_CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.32/28"
}

variable "my_VPC_PRIVATE_SUBNET2_CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.48/28"
}

variable "ENVIRONMENT" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "Development"
}

