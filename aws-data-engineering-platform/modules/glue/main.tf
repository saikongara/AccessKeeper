resource "aws_glue_catalog_database" "this" {
  name = var.glue_database_name

  parameters = {
    "description" = "Glue database for ETL processes"
  }
}

resource "aws_glue_catalog_table" "this" {
  name          = var.glue_table_name
  database_name = aws_glue_catalog_database.this.name

  storage_descriptor {
    location      = var.table_location
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    columns {
      name = "id"
      type = "int"
    }
    columns {
      name = "name"
      type = "string"
    }
  }

  table_type = "EXTERNAL_TABLE"
}

resource "aws_iam_role" "glue_role" {
  name = var.glue_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "glue.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "glue_policy_attachment" {
  name       = "${var.glue_role_name}-policy-attachment"
  roles      = [aws_iam_role.glue_role.name]
  policy_arn = var.glue_policy_arn
}

resource "aws_glue_job" "this" {
  name     = var.glue_job_name
  role_arn = aws_iam_role.glue_role.arn

  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = var.temp_dir
  }
}

resource "aws_glue_trigger" "this" {
  name     = var.glue_trigger_name
  type     = "SCHEDULED"
  schedule = var.trigger_schedule

  actions {
    job_name = aws_glue_job.this.name
  }
}

output "glue_database_name" {
  value = aws_glue_catalog_database.this.name
}

output "glue_table_name" {
  value = aws_glue_catalog_table.this.name
}

output "glue_job_name" {
  value = aws_glue_job.this.name
}

output "glue_trigger_name" {
  value = aws_glue_trigger.this.name
}