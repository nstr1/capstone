variable name {
  type        = string
  description = "instance name"
}

variable zone {
  type        = string
  default     = "europe-central2-c"
  description = "zone"
}

variable vpc {
  type        = string
  description = "vpc"
}

variable subnet {
  type        = string
  description = "subnet"
}

variable ephermal_ip {
    type        = bool
    description = "private or public instance"
}

variable ssh_pub_key {
    type        = string
    description = "public ssh key"
}

variable ssh_user {
    type        = string
    description = "ssh user"
}

variable machine_type {
  type        = string
  default     = "e2-micro"
}


variable tags {
  type        = list
}
