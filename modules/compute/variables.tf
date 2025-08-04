variable "ami" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair to use for SSH"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance into"
}

variable "name" {
  type        = string
  description = "Name tag for the instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with the instance"
}