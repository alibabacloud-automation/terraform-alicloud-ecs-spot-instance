#alicloud_kms_key
variable "pending_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = string
  default     = "30"
}

#alicloud_ram_role
variable "document" {
  description = "Authorization strategy of the RAM role."
  type        = string
  default     = <<EOF
  {
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "apigateway.aliyuncs.com",
            "ecs.aliyuncs.com"
          ]
        }
      }
    ],
    "Version": "1"
  }
  EOF
}

# Ecs instance variables
variable "private_ip" {
  description = "Configure Instance private IP address."
  type        = string
  default     = "172.16.0.10"
}

variable "private_ips" {
  description = "A list to configure Instance private IP address."
  type        = list(string)
  default     = ["172.16.0.10"]
}

variable "instance_name" {
  description = "Name used on all instances as prefix. Like TF-ECS-Instance-1, TF-ECS-Instance-2."
  type        = string
  default     = "tf-ecs-spot-name"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    Name = "ECS"
  }
}

variable "user_data" {
  description = "User data to pass to instance on boot."
  type        = string
  default     = "tf-user-data"
}

variable "description" {
  description = "Description of all instances."
  type        = string
  default     = "tf-description"
}

variable "internet_charge_type" {
  description = "The internet charge type of instance. Choices are 'PayByTraffic' and 'PayByBandwidth'."
  type        = string
  default     = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  description = "The maximum internet out bandwidth of instance."
  type        = number
  default     = 10
}

variable "dry_run" {
  description = "Whether to pre-detection. When it is true, only pre-detection and not actually modify the payment type operation. Default to false."
  type        = bool
  default     = false
}

variable "system_disk_size" {
  description = "The system disk size used to launch one or more ecs instances."
  type        = number
  default     = 20
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default = {
    Name = "ecs-spot-instance"
  }
}

variable "password" {
  description = "The password of instance."
  type        = string
  default     = "YourPassword123!"
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to an instance. It is conflicted with 'password'."
  type        = string
  default     = "YourPassword123!"
}

variable "deletion_protection" {
  description = "Whether enable the deletion protection or not. 'true': Enable deletion protection. 'false': Disable deletion protection."
  type        = bool
  default     = false
}