#!/bin/bash
#----- Uptime Script------
convertsecs() {
     ((h=${1}/3600))
      ((m=(${1}%3600)/60))
       ((s=${1}%60))
        printf "%02d:%02d\n" $h $m
    }
usage=( $(cat /proc/uptime) )
hist=( $(cat /home/jfouk/.uptime_history) )
active=${usage[0]}
start=${hist[0]}
active="${active%.*}"
start="${start%.*}"
total=$(( active - start ))
echo $(convertsecs $total)

