variable "project" {
  type        = string
}

variable "region" {
  type        = string
  default     = "us-central1"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  type        = string
  default     = "website-vm"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
}

variable "network" {
  type        = string
  default     = "default"
}