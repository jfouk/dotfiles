#!/bin/bash
# function myPi
# connects to raspberry pi whether on local network or public
# parameters:
#   local ip address:   ip address to connect if on local network
#   file containing public ip:  ip address if on public network
#   port:               port if on public network
function myPi()
{
    if [ $1 ] && [ $2 ] && [ $3 ]; then
        # check if we are connected to the same network as the pi
        # 0 for success anything else for failure
        SAMENETWORK=$(ping -c 1 -W 1 $1 &> /dev/null; echo $?)

        # if we are on the same network
        if [ "$SAMENETWORK" -eq "0" ]; then
            ssh pi@$1
        else
            local pubIp=$(tail -n 1 $2)
            ssh pi@$pubIp -p $3
        fi
    else
        echo "Incorrect usage. myPi local_ip_addr public_ip_addr_file port"
    fi


}

alias rpi="myPi 192.168.1.131 /mnt/c/Users/joncf/OneDrive/Rpi/publicIP.txt 30000"
