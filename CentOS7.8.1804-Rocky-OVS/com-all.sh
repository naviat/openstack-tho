#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh

echocolor "IP address"
source com-0-ipaddr.sh

echocolor "Environment"
source com-1-environment.sh

echocolor "Nova"
source com-2-nova.sh

echocolor "Neutron"
source com-3-neutron-selfservice.sh
