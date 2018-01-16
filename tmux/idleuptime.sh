#!/bin/bash
#----- Uptime Script------
convertsecs() {
     ((h=${1}/3600))
      ((m=(${1}%3600)/60))
       ((s=${1}%60))
        printf "%02d:%02d\n" $h $m
    }
usage=( $(cat /proc/uptime) )
active=${usage[0]}
idle=${usage[1]}
active="${active%.*}"
idle="${idle%.*}"

echo $(convertsecs $idle)
