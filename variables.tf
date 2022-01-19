variable "project_name" {
  default     = ""
  type        = string
}

variable "region" {
  default     = ""
  type        = string
}

variable "vpc_cidr_block" {
  default     = ""
  type        = string
}

variable "availability_zones" {
  default     = []
  type        = list
}

variable "public_subnets" {
  default     = []
  type        = list
}
