#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh


# Function uninstall components
components_uninstall () {
	echocolor "Uninstall nova-compute"
	sleep 3
	yum remove -y '*openstack*' '*nova*' '*neutron*'
}

# Function uninstall openvswitch
openvswitch_uninstall() {
	echocolor "Uninstall openvswitch"
	sleep 3
	
	ovs-vsctl del-br br-provider
	ovs-vsctl del-br br-tun
	ovs-vsctl del-br br-int

	sleep 3

	yum remove -y openvswitch

	echocolor "--Done--"

}

# Function clean the components lib/log
clean_lib_log () {
	echocolor "Clean the components lib/log"
	sleep 3

	rm -rf /var/lib/nova /etc/nova /etc/neutron /etc/openvswitch /var/log/nova /var/log/openvswitch /var/log/neutron
	sleep 3

    echocolor "---Done---"    
}


## Uninstall components
if ! rpm -qa | grep -qw '*openstack*'; then
    components_uninstall
fi

#components_uninstall

## Uninstall openvswitch
#openvswitch_uninstall

## Cleaning
#clean_lib_log

echocolor '                            _             _
                           | |           | |
  ___  _ __   ___ _ __  ___| |_ __ _  ___| | __
 / _ \| '\_ \ \/ \_ \ '_ \/ __| __/ _` |/ __| |/ /
| (_) | |_) |  __/ | | \__ \ || (_| | (__|   <
 \___/| .__/ \___|_| |_|___/\__\__,_|\___|_|\_\
      | |
      |_|'