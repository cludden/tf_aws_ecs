variable "additional_user_data_script" {
  description = "appends additional user data"
  type        = string
  default     = ""
}

variable "allowed_cidr_blocks" {
  description = "List of subnets to allow into the ECS Security Group. Defaults to ['0.0.0.0/0']"
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "ami" {
  description = "ami id"
  type        = string
  default     = ""
}

variable "ami_version" {
  description = "ami version"
  type        = string
  default     = "*"
}

variable "associate_public_ip_address" {
  description = "boolean flag to enable public ip association"
  type        = bool
  default     = false
}

variable "consul_image" {
  description = "Image to use when deploying consul, defaults to the hashicorp consul image"
  type        = string
  default     = "consul:latest"
}

variable "consul_memory_reservation" {
  description = "The soft limit (in MiB) of memory to reserve for the container, defaults 20"
  type        = number
  default     = 32
}

variable "docker_storage_size" {
  description = "EBS Volume size in Gib that the ECS Instance uses for Docker images and metadata"
  type        = number
  default     = 22
}

variable "dockerhub_email" {
  description = "Email Address used to authenticate to dockerhub. http://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html"
  type        = string
  default     = ""
}

variable "dockerhub_token" {
  description = "Auth Token used for dockerhub. http://docs.aws.amazon.com/AmazonECS/latest/developerguide/private-auth.html"
  type        = string
  default     = ""
}

variable "enable_agents" {
  description = "Enable Consul Agent and Registrator tasks on each ECS Instance"
  type        = bool
  default     = false
}

variable "ebs_block_device" {
  description = "EBS block devices to attach to the instance. (default: /dev/xvdcz)"
  type        = string
  default     = "/dev/xvdcz"
}

variable "extra_tags" {
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
  default = []
}

variable "heartbeat_timeout" {
  description = "Heartbeat Timeout setting for how long it takes for the graceful shutodwn hook takes to timeout. This is useful when deploying clustered applications like consul that benifit from having a deploy between autoscaling create/destroy actions. Defaults to 180"
  type        = string
  default     = "180"
}

variable "asg_delete_extra_timeout" {
  description = "Extra time that `terraform apply` will wait for ASG deletion (default 600). This is added on top of `heartbeat_timeout`. This variable is customizable for when the instances take longer than 600sec to shut down once shutdown is initiated."
  type        = number
  default     = 600
}

variable "iam_path" {
  description = "IAM path, this is useful when creating resources with the same name across multiple regions. Defaults to /"
  default     = "/"
  type        = string
}

variable "custom_iam_policy" {
  description = "Custom IAM policy (JSON). If set will overwrite the default one"
  default     = ""
  type        = string
}

variable "instance_type" {
  description = "AWS Instance type, if you change, make sure it is compatible with AMI, not all AMIs allow all instance types "
  default     = "t2.micro"
  type        = string
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
  type        = string
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers."
  type        = list(string)
  default     = []
}

variable "min_servers" {
  description = "Minimum number of ECS servers to run."
  type        = number
  default     = 1
}

variable "max_servers" {
  description = "Maximum number of ECS servers to run."
  type        = number
  default     = 10
}

variable "name" {
  description = "AWS ECS Cluster Name"
  type        = string
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "region" {
  description = "The region of AWS, for AMI lookups."
  default     = "us-east-1"
  type        = string
}

variable "registrator_image" {
  description = "Image to use when deploying registrator agent, defaults to the gliderlabs registrator:latest image"
  type        = string
  default     = "gliderlabs/registrator:latest"
}

variable "registrator_memory_reservation" {
  description = "The soft limit (in MiB) of memory to reserve for the container, defaults 32"
  type        = number
  default     = 32
}

variable "security_group_ids" {
  description = "A list of Security group IDs to apply to the launch configuration"
  type        = list(string)
  default     = []
}

variable "servers" {
  description = "The number of servers to launch."
  type        = number
  default     = 1
}

variable "spot_bid_price" {
  description = "If specified, spot instances will be requested at this bid price.  If not specified, on-demand instances will be used."
  default     = ""
}

variable "subnet_id" {
  description = "The AWS Subnet ID in which you want to delpoy your instances"
  type        = list(string)
}

variable "tagName" {
  description = "Name tag for the servers"
  type        = string
  default     = "ECS Node"
}

variable "user_data" {
  type    = string
  default = ""
}

variable "vpc_id" {
  description = "The AWS VPC ID which you want to deploy your instances"
  type        = string
}

variable "enabled_metrics" {
  description = "A list of metrics to collect"
  type        = list(string)
  default     = []
}
