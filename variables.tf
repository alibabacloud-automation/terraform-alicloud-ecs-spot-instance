variable "region" {
  description = "(Deprecated from version 1.1.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "(Deprecated from version 1.1.0) The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}

variable "shared_credentials_file" {
  description = "(Deprecated from version 1.1.0) This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "(Deprecated from version 1.1.0) Skip staticvalidation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

# InstanceTypes data source variables
variable "instance_type_family" {
  description = "The instance type family used to retrieve bare metal CPU instance type."
  type        = string
  default     = ""
}

variable "instance_charge_type" {
  description = "The charge type of instance. Choices are 'PostPaid' and 'PrePaid'."
  type        = string
  default     = "PostPaid"
}

variable "cpu_core_count" {
  description = "core count used to retrieve instance types."
  type        = number
  default     = 1
}

variable "memory_size" {
  description = "Memory size used to retrieve instance types."
  type        = number
  default     = 2
}

# Images data source variables
variable "most_recent" {
  description = "If more than one result are returned, select the most recent one."
  type        = bool
  default     = true
}

variable "owners" {
  description = "Filter results by a specific image owner. Valid items are 'system', 'self', 'others', 'marketplace'."
  type        = string
  default     = "system"
}

variable "image_name_regex" {
  description = "A regex string to filter resulting images by name."
  type        = string
  default     = ""
}

# Ecs instance variables
variable "number_of_instances" {
  description = "The number of instances to be created."
  type        = number
  default     = 1
}

variable "image_id" {
  description = "The image id used to launch one or more ecs instances."
  type        = string
  default     = ""
}

variable "image_ids" {
  description = "A list of ecs image IDs to launch one or more ecs instances."
  type        = list(string)
  default     = []
}

variable "instance_type" {
  description = "The instance type used to launch one or more ecs instances."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "A list of security group ids to associate with."
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch in VPC."
  type        = string
  default     = ""
}

variable "vswitch_ids" {
  description = "A list of virtual switch IDs to launch in."
  type        = list(string)
  default     = []
}

variable "private_ip" {
  description = "Configure Instance private IP address."
  type        = string
  default     = ""
}

variable "private_ips" {
  description = "A list to configure Instance private IP address."
  type        = list(string)
  default     = []
}

variable "instance_name" {
  description = "Name used on all instances as prefix. Like TF-ECS-Instance-1, TF-ECS-Instance-2."
  type        = string
  default     = ""
}

variable "use_num_suffix" {
  description = "Always append numerical suffix(like 001, 002 and so on) to instance name and host name, even if number_of_instances is 1."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "resource_group_id" {
  description = "The Id of resource group which the instance belongs."
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data to pass to instance on boot."
  type        = string
  default     = ""
}

variable "description" {
  description = "Description of all instances."
  type        = string
  default     = ""
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

variable "associate_public_ip_address" {
  description = "Whether to associate a public ip address with an instance in a VPC."
  type        = bool
  default     = false
}

variable "dry_run" {
  description = "Whether to pre-detection. When it is true, only pre-detection and not actually modify the payment type operation. Default to false."
  type        = bool
  default     = false
}

variable "system_disk_category" {
  description = "The system disk category used to launch one or more ecs instances."
  type        = string
  default     = "cloud_efficiency"
}

variable "system_disk_size" {
  description = "The system disk size used to launch one or more ecs instances."
  type        = number
  default     = 20
}

variable "data_disks" {
  description = "Additional data disks to attach to the scaled ECS instance."
  type        = list(map(string))
  default     = []
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = {}
}

variable "password" {
  description = "The password of instance."
  type        = string
  default     = ""
}

variable "kms_encrypted_password" {
  description = "An KMS encrypts password used to an instance. It is conflicted with 'password'."
  type        = string
  default     = ""
}

variable "kms_encryption_context" {
  description = "An KMS encryption context used to decrypt 'kms_encrypted_password' before creating or updating an instance with 'kms_encrypted_password'."
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "The name of SSH key pair that can login ECS instance successfully without password. If it is specified, the password would be invalid."
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Instance RAM role name. The name is provided and maintained by RAM. You can use 'alicloud_ram_role' to create a new one."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Whether enable the deletion protection or not. 'true': Enable deletion protection. 'false': Disable deletion protection."
  type        = bool
  default     = false
}

variable "security_enhancement_strategy" {
  description = "The security enhancement strategy."
  type        = string
  default     = "Active"
}

variable "spot_strategy" {
  description = "The spot strategy of a Pay-As-You-Go instance. Value range:'SpotWithPriceLimit': A price threshold for a spot instance. 'SpotAsPriceGo': A price that is based on the highest Pay-As-You-Go instance"
  type        = string
  default     = "SpotWithPriceLimit"
}

variable "spot_price_limit" {
  description = "The hourly price threshold of a instance, and it takes effect only when parameter 'spot_strategy' is 'SpotWithPriceLimit'. Three decimals is allowed at most."
  type        = number
  default     = 0.5
}

variable "host_name" {
  description = "Host name used on all instances as prefix. Like TF-ECS-Host-Name-1, TF-ECS-Host-Name-2."
  type        = string
  default     = ""
}