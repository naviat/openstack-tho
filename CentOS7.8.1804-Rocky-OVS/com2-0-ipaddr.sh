#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh

# Function config COMPUTE node
config_hostname () {
	echo "$HOST_COM2" > /etc/hostname
	hostnamectl set-hostname $HOST_COM2

	cat << EOF >/etc/hosts
127.0.0.1	localhost

$CTL_MGNT_IP	$HOST_CTL
$COM1_MGNT_IP	$HOST_COM1
$COM2_MGNT_IP	$HOST_COM2
EOF

}

# Function IP address
config_ip () {
	touch /etc/sysconfig/network-scripts/ifcfg-$COM2_EXT_IF
	touch /etc/sysconfig/network-scripts/ifcfg-$COM2_MGNT_IF

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

	cat << EOF > /etc/sysconfig/network-scripts/ifcfg-$COM2_MGNT_IF
DEVICE=$COM2_MGNT_IF
BOOTPROTO=none
ONBOOT=yes
IPADDR=$COM2_MGNT_IP
NETMASK=$COM2_MGNT_NETMASK
DEFROUTE=no
EOF

EOF

	ip a flush $COM2_EXT_IF
	ip a flush $COM2_MGNT_IF

	systemctl restart network
}

# Function config software of Centos
config_software () {
	systemctl stop firewalld
	systemctl disable firewalld
}

#######################
###Execute functions###
#######################

# Config COMPUTE node
echocolor "Config COMPUTE node"
sleep 3
## Config hostname
config_hostname

## IP address
config_ip

## Config software of Centos
config_software
