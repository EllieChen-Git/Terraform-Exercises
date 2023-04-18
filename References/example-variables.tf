
# String Variable
variable "resource_group_name" {
  type = string
  description = "the name of the resource group"
  # default = "rg-terraform2"
  # This declaration includes a default value for the variable, so the resource_group_name variable will not be a required input.
}

# List of String Variable
variable "az_names" {
  type = list(string)
  default = ["us-west-1a"]
}

# List of Obj Variable
variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))

  default = [{
    internal = 8300
    external = 8300
    protocol = "tcp"
  }]
}


