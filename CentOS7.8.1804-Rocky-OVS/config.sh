#!/bin/bash
#Author Dam Van Hai

##########################################
#### Set local variable  for scripts #####
##########################################

echocolor "Set local variable for scripts"
sleep 3

#  Ipaddress variable and Hostname variable
## Assigning IP for controller node
CTL_EXT_IP=192.168.122.141                # NAT IP
CTL_EXT_NETMASK=255.255.255.0
CTL_EXT_IF=eth0                       # NAT interface name
CTL_MGNT_IP=172.16.20.141              # Host-only IP
CTL_MGNT_NETMASK=255.255.255.0
CTL_MGNT_IF=eth1               # Host-only Interface name

## Assigning IP for Compute host
COM1_EXT_IP=192.168.122.193                    # NAT IP
COM1_EXT_NETMASK=255.255.255.0
COM1_EXT_IF=eth0                      # NAT interface name
COM1_MGNT_IP=172.16.20.193             # Host-only IP
COM1_MGNT_NETMASK=255.255.255.0
COM1_MGNT_IF=eth1                     # Host-only Interface name

COM2_EXT_IP=192.168.122.31                    # NAT IP
COM2_EXT_NETMASK=255.255.255.0
COM2_EXT_IF=eth0                      # NAT interface name
COM2_MGNT_IP=172.16.20.31             # Host-only IP
COM2_MGNT_NETMASK=255.255.255.0
COM2_MGNT_IF=eth1                     # Host-only Interface name

## Gateway for EXT network
GATEWAY_EXT_IP=192.168.122.1                 # NAT Gateway IP
CIDR_EXT=192.168.2.0/24
CIDR_MGNT=172.16.20.0/24               # Host-only Network
PREFIX_EXT=24
PREFIX_MGNT=24
DHCP_START=192.168.2.180
DHCP_END=192.168.2.189

## Hostname variable
HOST_CTL=controller
HOST_COM1=compute1
HOST_COM2=compute2

# Password for service
SERVICE_DEFAULT_PASS="Welcome123"

ADMIN_PASS=$SERVICE_DEFAULT_PASS
DEMO_PASS=$SERVICE_DEFAULT_PASS
RABBIT_PASS=$SERVICE_DEFAULT_PASS
KEYSTONE_DBPASS=$SERVICE_DEFAULT_PASS
GLANCE_DBPASS=$SERVICE_DEFAULT_PASS
GLANCE_PASS=$SERVICE_DEFAULT_PASS
METADATA_SECRET=$SERVICE_DEFAULT_PASS
NEUTRON_DBPASS=$SERVICE_DEFAULT_PASS
NEUTRON_PASS=$SERVICE_DEFAULT_PASS
NOVA_PASS=$SERVICE_DEFAULT_PASS
NOVA_DBPASS=$SERVICE_DEFAULT_PASS
PLACEMENT_PASS=$SERVICE_DEFAULT_PASS
PLACEMENT_DBPASS=$SERVICE_DEFAULT_PASS
CINDER_DBPASS=$SERVICE_DEFAULT_PASS
CINDER_PASS=$SERVICE_DEFAULT_PASS
HEAT_DBPASS=$SERVICE_DEFAULT_PASS
HEAT_PASS=$SERVICE_DEFAULT_PASS
HEAT_DOMAIN_ADMIN_PASS=$SERVICE_DEFAULT_PASS