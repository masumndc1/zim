[root@localhost terraform-test]# cat instance.tf

provider "vsphere" {
    vsphere_server = "${var.vsphere_server}"
    user = "${var.vsphere_user}"
    password = "${var.vsphere_password}"
    allow_unverified_ssl = true
}
... to output something in terraform we can do the following

[root@localhost terraform-test]# cat instance.tf

output "testing" {
  value = "${data.vsphere_datastore.datastore.id}"
}
