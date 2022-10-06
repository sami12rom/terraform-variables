
variable "glue_jobs" {
  type=map
}

variable "profile" {
  description = "The AWS region to create things in."
  type        = string
  default = "poc"
}

