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
				"*glance*" "*cinder*" "*neutron*"
	
	# Warning! Dangerous step! Deletes local application data
	rm -rf /root/.my.cnf /var/lib/glance /var/lib/nova /etc/nova /etc/swift \
	/srv/node/device*/* /var/log/keystone
}

uninstall_sql

uninstall_mq

uninstall_memcached

uninstall_ops_packages