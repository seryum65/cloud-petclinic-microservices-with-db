//variable "aws_secret_key" {}
//variable "aws_access_key" {}
variable "region" {
  default = "us-east-1"
}
variable "mykey" {
  default = "petclinic-ranchertr"
}
variable "tags" {
  default = "petclinic-rancher-server"
}
variable "myami" {
  description = "ubuntu 20.04 ami"
  default = "ami-0261755bbcb8c4a84"
}
variable "instancetype" {
  default = "t3a.medium"
}

variable "secgrname" {
  default = "rancher-server-sec-gr"
}

variable "domain-name" {
  default = "*.yusufsahin.click"
}

variable "rancher-subnet" {
  default = "subnet-07be199b86168820a"
}

variable "hostedzone" {
  default = "yusufsahin.click"
}

variable "tg-name" {
  default = "clarus-rancher-http-80-tg"
}

variable "alb-name" {
  default = "petclinic-rancher-alb"
}

variable "controlplane-policy-name" {
  default = "petclinic_policy_for_rke-controlplane_role"
}

variable "worker-policy-name" {
  default = "petclinic_policy_for_rke_etcd_worker_role"
}

variable "rancher-role" {
  default = "petclinic_role_rancher"
}

variable "controlplane-attach" {
  default = "petclinic_attachment_for_rancher_controlplane"
}

variable "worker-attach" {
  default = "petclinic_attachment_for_rancher_controlplane"
}