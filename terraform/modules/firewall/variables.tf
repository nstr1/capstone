variable network {
    type        = string
    description = "network which the rules are applied to"
}

variable name {
  type = string
}

variable source_ranges {
  type = list
}

variable target_tags {
  type = list
}

variable protocol {
  type  = string
}

variable ports {
  type = list
  default = []
}
