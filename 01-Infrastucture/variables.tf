variable "client_name" {
  default= "benco-republic"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "private_key" {
  type      = string
  sensitive = true
}
