variable "project" {
  description = "Name of project on GCP"
  default     = "cci-eval"
}
variable "region" {
  description = "Region where instances should be created"
  default     = "us-west1"
}

variable "zone" {
  description = "Zone where instances should be created"
  default     = "us-west1-b"
}

variable "ssh_keys" {
  description = "Path to SSH key for connecting to instances" 
  default     = "~/.ssh"
}

variable "machine_type" {
  description = ""
  default     = "n1-standard-16"
}

variable "os_image" {
  description = ""
  default     = "ubuntu-1604-lts"
}

variable "disk_size" {
  description = ""
  default     = "100"
}