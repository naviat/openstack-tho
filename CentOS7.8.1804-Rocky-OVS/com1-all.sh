#!/bin/bash
#Author Dam Van Hai

source function.sh
source config.sh

echocolor "IP address"
source com1-0-ipaddr.sh

echocolor "Environment"
source com1-1-environment.sh

echocolor "Nova"
source com1-2-nova.sh

echocolor "Neutron"
source com1-3-neutron-selfservice.sh

echo -e "\033[1;31m -FINISH- \033[0m"

