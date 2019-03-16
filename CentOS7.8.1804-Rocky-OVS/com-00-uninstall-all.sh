#!/bin/bash
#Author Dam Van Hai

# Function uninstall nova-compute
nova_uninstall () {
	echocolor "Uninstall nova-compute"
	sleep 3
	yum remove openstack-nova-compute -y
}

# Function uninstall the components Neutron
neutron_uninstall () {
	echocolor "Uninstall the components Neutron"
	sleep 3

	yum remove openstack-neutron-openvswitch ebtables ipset -y
	
	systemctl restart openvswitch
}

