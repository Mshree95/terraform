variable "instance_type" {
  type        = string
  default     = ""
}

variable "pem_key" {
  type        = string
  default     = ""
}

variable "bucket_name" {
    type        = string
    default     = "my-s3-bucket-123456897"
}

variable "dynamodb_name" {
     type        = string
     default     = "dynamodb_state_locking_table"
}
variable "hash_key" {
    type        = string
    default     = "LockID"
}
