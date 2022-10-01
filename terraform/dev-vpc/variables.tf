variable project {
  type = string
}

variable region {
  default = "europe-central2"
}

variable zone {
  default = "europe-central2-c"
}

variable ssh_user {
  type = string

}

variable sql_user_pass {
  type = string
}

variable inventory_path {
  type        = string
}

variable app_key_path {
  type        = string
}

variable whitelist {
  type        = list
  default     = ["0.0.0.0/0"]
}
