resource "aws_config_configuration_recorder" "recorder" {
  name     = var.name
  role_arn = var.iam_role_arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "channel" {
  name           = var.name
  s3_bucket_name = var.s3_bucket
}

resource "aws_config_config_rule" "s3_bucket_encrypted" {
  name = "s3-bucket-encrypted"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}

output "config_recorder_id" {
  value = aws_config_configuration_recorder.recorder.id
}

