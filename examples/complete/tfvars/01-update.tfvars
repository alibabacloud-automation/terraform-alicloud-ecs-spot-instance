#alicloud_kms_key
pending_window_in_days = 7

#alicloud_ram_role
document = <<EOF
		{
		  "Statement": [
			{
			  "Action": "sts:AssumeRole",
			  "Effect": "Allow",
			  "Principal": {
				"Service": [
				  "ecs.aliyuncs.com"
				]
			  }
			}
		  ],
		  "Version": "1"
		}
	  EOF

#Specify network setting
private_ip  = "172.16.0.12"
private_ips = ["172.16.0.12"]

#Specify instance basic attributes
instance_name = "update-tf-ecs-spot-name"
tags = {
  Name = "updateECS"
}
user_data   = "update-tf-user-data"
description = "update-tf-description"

#Specify instance charge attributes
internet_charge_type       = "PayByBandwidth"
internet_max_bandwidth_out = "20"
dry_run                    = true

#Specify instance disk setting
system_disk_size = 50
volume_tags = {
  Name = "update-ecs-spot-instance"
}

#Specify instance access setting
password               = "YourPassword123!update"
kms_encrypted_password = "YourPassword123!update"