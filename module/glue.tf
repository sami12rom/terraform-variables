resource "aws_glue_job" "etl_test_job_tf_with_vars" {
    name                    	= var.glue_job_name
    description             	= var.glue_job_description
    role_arn                	= var.glue_job_role_arn
    execution_property {
      max_concurrent_runs   	= var.glue_job_max_concurrent_runs
    }
    command {
      name                  	= var.glue_job_command_name
      script_location       	= "s3://bucket/process/Test/glue/etl_test_job.py"
      python_version        	= var.glue_job_python_version
    }
    default_arguments           = {
      "--extra-py-files"      	= "s3://bucket/process/Test/glue/common_utilities-0.1.348982-py3.6.egg"
      "--TempDir"             	= "s3://bucket/process/Test/glue/temp"
    }
    non_overridable_arguments   = {
      "--data_confidentiality"	= "DC3"
      "--landing_table"       	= "DFKKMOP"
      "--partition_column"    	= "load_date"
      "--data_path"           	= "INDX/DDL/ISUR_DFKKMOP_DAL"
      "--mappings"            	= "[[\"old_col_1\", \"old_type_1\", \"new_col_1\", \"new_type_1\"], [\"old_col_2\", \"old_type_2\", \"new_col_2\", \"new_type_2\"], [\"old_col_3\", \"old_type_3\", \"new_col_3\", \"new_type_3\"], [\"old_col_4\", \"old_type_4\", \"new_col_4\", \"new_type_4\"]]"
    }
    connections             	= var.glue_job_connections
    max_retries             	= var.glue_job_max_retries
    timeout                 	= var.glue_job_timeout
    glue_version            	= var.glue_job_glue_version
    number_of_workers       	= var.glue_job_number_of_workers
    worker_type             	= var.glue_job_worker_type
    tags                        = {
      Owner                 	= "inl"
      Service               	= "Datalake"
    }
}
