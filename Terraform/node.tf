provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_vcenter
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_host" "host" {
  name          = var.vsphere_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "//${var.vsphere_datacenter}/host/${var.vsphere_cluster}/Resources/${var.vsphere_pool}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere_datacenter}/vm/${var.vsphere_template_folder}/${var.vsphere_template_name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.vsphere_vm_count

  name             = "node-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vsphere_vm_folder

  enable_disk_uuid           = true
  wait_for_guest_net_timeout = 0

  num_cpus  = 1
  memory    = 4096
  guest_id  = "centos7_64Guest"
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "node-${count.index + 1}-disk"
    size  = 35
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 0

      linux_options {
        host_name = "node-${count.index + 1}"
        domain    = "${var.vsphere_host}.local"
      }

      network_interface {
      }
    }
  }
}

