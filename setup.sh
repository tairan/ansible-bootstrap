#!/bin/bash
# This script runs setup for Ansible control machine.

INVENTORY_FILE="inventory"
OPTIONS=""
PLAYBOOK="install.yml"

is_ansible_installed() {
	type -p ansible-playbook > /dev/null
}


is_ansible_installed
if [ $? -ne 0 ]; then
	yum -y install epel-release ansible
fi


ansible-playbook -i "${INVENTORY_FILE}" -v \
	$OPTIONS \
	$PLAYBOOK 2>&1
