variable "tf_database" {
  default     = "db.t3.micro"
  description = "The Database Instance type"
  type        = string
}

variable "multi_az_deployment" {
  default     = false
  description = "Create a Standby DB Instance"
  type        = bool
}
