# --------------------
# VCenter credentials
variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
}

# --------------------
# VM specs
variable "vsphere_datacenter" {
  description = "In which datacenter the VM will be deployed"
}

variable "vsphere_host" {
  description = "Host on which we deploy the new virtual machine"
}

variable "vsphere_vm_count" {
  description = "Number of VM to create per host"
}

variable "vsphere_vm_folder" {
  description = "In which folder the VM will be store"
}

variable "vsphere_cluster" {
  description = "In which cluster the VM will be deployed"
}

variable "vsphere_pool" {
  description = "In which pool the VM will be deployed"
}

variable "vsphere_datastore" {
  description = "What is the name of the VM datastore"
}

variable "vsphere_port_group" {
  description = "In which port group the VM NIC will be configured (default: VM Network)"
  default     = "VM Network"
}

variable "vsphere_time_zone" {
  description = "What is the timezone of the VM (default: UTC)"
  default     = "UTC"
}

variable "vsphere_template_name" {
  description = "The template to clone to create the VM"
}

variable "vsphere_template_folder" {
  description = "Template folder"
}

