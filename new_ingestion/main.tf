module "glue_jobs" {
    source = "../module"
    for_each = var.glue_jobs
    glue_job_name = each.key
    glue_job_max_retries  = each.value.glue_job_max_retries
}
