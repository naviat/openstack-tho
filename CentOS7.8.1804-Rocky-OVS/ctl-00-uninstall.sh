#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh

# Function uninstall mysql
uninstall_sql () {
	echocolor "Uninstall SQL database - Mariadb"
	sleep 3

	yum remove MariaDB-server MariaDB-client python2-PyMySQL  -y

	rm -rf /var/lib/mysql

	rm /etc/my.cnf

}

# Function uninstall message queue
uninstall_mq () {
	echocolor "Uninstall Message queue (rabbitmq)"
	sleep 3

	yum remove rabbitmq-server -y
}

# Function uninstall Memcached
uninstall_memcached () {
	echocolor "Uninstall Memcached"
	sleep 3

	systemctl stop memcached.service

	yum remove memcached python-memcached -y
} 

# Function Uninstall OpenStack packages (python-openstackclient)
uninstall_ops_packages () {
	echocolor "Uninstall OpenStack Component"
	sleep 3
	yum remove "*openstack*" "*nova*" "*keystone*" \
				"*glance*" "*cinder*" "*neutron*" -y
	
	# Warning! Dangerous step! Deletes local application data
	rm -rf /root/.my.cnf /var/lib/glance /var/lib/nova /etc/nova /etc/swift \
	/srv/node/device*/* /var/log/keystone

	echocolor "Restore Network config"
	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$CTL_EXT_IF
DEVICE=$CTL_EXT_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$CTL_EXT_IP
NETMASK=$CTL_EXT_NETMASK
GATEWAY=$GATEWAY_EXT_IP
DNS1=8.8.8.8
DNS2=8.8.4.4

EOF
}

# Function uninstall openvswitch
uninstall_openvswitch() {
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

	systemctl restart network 
	sleep 5
	echocolor "--Done--"

}


uninstall_sql

uninstall_mq

uninstall_memcached

uninstall_ops_packages

uninstall_openvswitch

echo -e "\033[1;31m -REMOVED- \033[0m"