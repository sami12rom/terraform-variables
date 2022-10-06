
variable glue_job_name {
    type    = string
}

variable "profile" {
  description = "The AWS region to create things in."
  type        = string
  default = "poc"
}


variable glue_job_description {
    type    = string
    default = "Glue job created by Terraform"
}

variable glue_job_role_arn {
    type    = string
    default = "arn:aws:iam::149072226401:role/INL-GLUE-WORKER-ROLE"
}

variable glue_job_max_concurrent_runs {
    type    = number
    default = 1
}

variable glue_job_command_name {
    type    = string
    default = "glueetl"
}

variable glue_job_python_version {
    type    = string
    default = "3"
    validation {
        error_message   = "Only Python Versions (3) are supported."
        condition       = can(regex("^3$", var.glue_job_python_version))
    }
}

variable glue_job_default_arguments {
    type    = map
    default = {}
}

variable glue_job_non_overridable_arguments {
    type    = map(string)
    default = {}
}

variable glue_job_connections {
    type    = list(string)
    default = []
}

variable glue_job_max_retries {
    type    = number
    default = 0
}

variable glue_job_timeout {
    type    = number
    default = 60
}

variable glue_job_tags {
    type    = map
    default = {
        Owner = "inl"
        Account = "c_plus"
    }
}

variable glue_job_notify_delay_after {
    type    = number
    default = 1
}

variable glue_job_glue_version {
    type    = string
    default = "2.0"
    validation {
        error_message   = "Only Glue Versions (2.0, 3.0) are supported."
        condition       = can(regex("^2.0$|^3.0$", var.glue_job_glue_version))
    }
}

variable glue_job_number_of_workers {
    type    = number
    default = 2
}

variable glue_job_worker_type {
    type    = string
    default = "G.1X"
}
