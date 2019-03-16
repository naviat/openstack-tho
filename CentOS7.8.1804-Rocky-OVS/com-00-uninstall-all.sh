#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh

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

## Restart Network
systemctl restart network

## Uninstall Nova
nova_uninstall

## Uninstall Neutron
neutron_uninstall
