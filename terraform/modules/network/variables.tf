variable vpc_name {
  type        = string
  description = "vpc name"
}

variable sub1_name {
  type        = string
  description = "subnet 1 name"
}

variable sub1_cidr {
  type        = string
  description = "subnet 1 cidr range"
}

variable sub1_private {
  type        = string
  default     = "false"
  description = "public or private subnet"
}

variable sub2_name {
  type        = string
  description = "subnet 2 name"
}

variable sub2_cidr {
  type        = string
  description = "subnet 2 cidr range"
}

variable sub2_private {
  type        = string
  default     = "false"
  description = "public or private subnet"
}


