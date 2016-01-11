#!/bin/bash


link=( $(ls -lat $(readlink $ORG_NOTES/Journal/TODAY.org)) )
log=( $(tail -1 $ORG_NOTES/.log/daily_orgnotes_log.txt))
echo "${link[5]} ${link[6]} ${link[7]}" 
#echo "$(date +%b\ %e\ %H:%M)" 
echo "${log[0]} ${log[1]}"
#if [ "${link[5]} ${link[6]} ${link[7]}" == "$(date +%b\ %e\ %H:%M)" ]; then
if [ "${link[5]} ${link[6]} ${link[7]}" == "${log[1]} ${log[2]}" ]; then
    echo "match"
else
    echo "no"
fi

