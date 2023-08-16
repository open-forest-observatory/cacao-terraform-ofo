resource "local_file" "ansible-inventory" {
    count = var.power_state == "active" ? 1 : 0
    content = templatefile("${path.module}/hosts.yml.tmpl",
    {
        server_ips = openstack_compute_floatingip_associate_v2.os_floatingips_associate.*.floating_ip
        server_names = openstack_compute_instance_v2.os_instances.*.name # we could use this instead of an generically generated index name
        username = local.real_username
        manila_share_key = var.manila_share_key
        primary_metashape_license = var.primary_metashape_license
        secondary_metashape_license = var.secondary_metashape_license
    })
    filename = "${path.module}/ansible/hosts.yaml"
}

resource "null_resource" "ansible-execution" {
    count = var.do_ansible_execution && var.power_state == "active" ? 1 : 0

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ANSIBLE_SSH_PIPELINING=1 ANSIBLE_CONFIG=ansible.cfg ansible-playbook -i hosts.yaml playbook.yaml"
        working_dir = "${path.module}/ansible"
    }

    triggers = {
        always_run = "${timestamp()}"
    }

    depends_on = [
        local_file.ansible-inventory
    ]

}
