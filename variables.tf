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
}

variable "machine_type" {
  description = ""
  default     = "n1-standard-16"
}

variable "os_image" {
  description = ""
  default     = "ubuntu-os-cloud/ubuntu-1404-lts"
}

variable "disk_size" {
  description = ""
  default     = "70"
}