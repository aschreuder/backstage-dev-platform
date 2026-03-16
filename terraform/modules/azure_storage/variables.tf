variable "storage_account_name" {
  type = string

    # Add a guardrail to ensure Devs adhere to naming convention
    validation {
        condition     = contains(["stbackstagecoredev01", "stbackstagecoreprod01", "stbackstagedatadev01"], var.storage_account_name)
        error_message = "Error: The storage_account_name must be one of the pre-approved enterprise names."
  }
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" { 
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "access_tier" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_access_type" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = { environment = "dev" }
}