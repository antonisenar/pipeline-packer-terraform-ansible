# VMware VMs configuration #
# vCenter connection
vsphere_vcenter = "192.168.1.245"
vsphere_user = "administrator@senar.local"
vsphere_password = "Password2020."
vsphere_unverified_ssl = "true"

# Organization
vsphere_datastore = "DatastoreLocalIMAC" 
# could also be like this:  vsphere_datastore = "Shared Storages/[DATASTORE_NAME]"
vsphere_datacenter = "Datacenter"
vsphere_cluster = "SENAR"
vsphere_host = "192.168.1.114"
vsphere_time_zone = "UTC"

# About the template to use 
vsphere_template_folder = ""
vsphere_template_name = "centos7"

# Customize
vsphere_vm_count = "3"
vsphere_pool = "RKE"
vsphere_vm_folder = "RKE"