#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh


# Function uninstall components
components_uninstall () {
	echocolor "Uninstall components"
	sleep 3
	yum remove -y '*openstack*' '*nova*' '*neutron*'

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$COM2_EXT_IF
DEVICE=$COM2_EXT_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$COM2_EXT_IP
NETMASK=$COM2_EXT_NETMASK
GATEWAY=$GATEWAY_EXT_IP
DNS1=8.8.8.8
DNS2=8.8.4.4

EOF

}

# Function uninstall openvswitch
openvswitch_uninstall() {
	echocolor "Uninstall openvswitch"
	sleep 3
	if ! [ -x "$(command -v ovs-vsctl)" ]; then 
		echocolor "You are not install it before, right!"
	else
		ovs-vsctl del-br br-provider
		ovs-vsctl del-br br-tun
		ovs-vsctl del-br br-int
		yum remove -y openvswitch
	fi
	sleep 3
	echocolor "--Done--"

}

# Function clean the components lib/log
clean_lib_log () {
	echocolor "Clean the components lib/log"
	sleep 3

	rm -rf /var/lib/nova /etc/nova /etc/neutron /etc/openvswitch /var/log/nova /var/log/openvswitch /var/log/neutron /sbin/ifup-local /etc/sysconfig/network-scripts/ifcfg-br-provider
	sleep 3

    echocolor "---DONE---"    
}


## Uninstall components
components_uninstall

## Uninstall openvswitch
openvswitch_uninstall

## Cleaning
clean_lib_log