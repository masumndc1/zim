

... my full openstack config file 

provider "openstack" {
  user_name   = "username"
  tenant_name = "tenant_name"
  password    = "pass"
  auth_url    = "http://<ip_address_here>/identity"
  region      = "RegionOne"
}

resource "openstack_images_image_v2" "debian" {
  name   = "debian_image"
  local_file_path = "/location/of/qcow2/debian-9.7.0-openstack-amd64.qcow2"
  container_format = "bare"
  disk_format = "qcow2"
  visibility = "shared"
}

# router external gateway data block here

data "openstack_networking_network_v2" "public" {
  name = "public"
}

# router block here

resource "openstack_networking_router_v2" "router3" {
  name           = "router3"
  admin_state_up = "true"
  external_network_id = "${data.openstack_networking_network_v2.public.id}"
}

resource "openstack_networking_router_interface_v2" "interface1" {
  router_id = "${openstack_networking_router_v2.router3.id}"
  subnet_id = "${openstack_networking_subnet_v2.private2_subnet.id}"
}

### networking block comes here

resource "openstack_networking_network_v2" "private2" {
  name           = "private2"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "private2_subnet" {
  name       = "private2_subnet"
  network_id = "${openstack_networking_network_v2.private2.id}"
  cidr       = "10.10.30.0/24"
  ip_version = 4
}

### security group 

resource "openstack_compute_secgroup_v2" "secgroup2" {
  name        = "secgroup2"
  description = "a security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  
  rule {
    from_port   = 80 
    to_port     = 80 
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443
    to_port     = 443 
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
  
  rule {
    from_port   = 8080
    to_port     = 8080
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

### networking port 

resource "openstack_networking_port_v2" "debianport2" {
  name               = "debianport2"
  network_id         = "${openstack_networking_network_v2.private2.id}"
  admin_state_up     = "true"
}

# key pair 

resource "openstack_compute_keypair_v2" "stack-keypair" {
  name       = "stack-keypair"
  public_key = "${file("/location/of/id_rsa.pub")}"
}


resource "openstack_compute_instance_v2" "terraform-test" {
  name            = "terraform-test"
  image_id        = "${openstack_images_image_v2.debian.id}"
  flavor_name       = "ds512M"
  key_pair        = "${openstack_compute_keypair_v2.stack-keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.secgroup2.name}"]

  network {
    name = "${openstack_networking_network_v2.private2.name}"
  }
}

resource "openstack_networking_floatingip_v2" "floatingip50" {
  pool = "public"
  address = "172.24.4.75"
# i wanted fixed floating ip always
}

resource "openstack_compute_floatingip_associate_v2" "floatingipasso50" {
  floating_ip = "${openstack_networking_floatingip_v2.floatingip50.address}"
  instance_id = "${openstack_compute_instance_v2.terraform-test.id}"
}

output "floating-ip" {
  value = "floating ip is ${openstack_networking_floatingip_v2.floatingip50.address}"
}

### end



