output "instance_uuids" {
  value = openstack_compute_instance_v2.os_instances.*.id
}

output "ip_addresses" {
  value = openstack_networking_floatingip_v2.os_floatingips.*.address
  description = "Public IP addresses"
}