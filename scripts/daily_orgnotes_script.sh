#!/bin/bash

# Script to create daily org file for each day
# Also links a TODAY.org each day for easier access

# check if orgnotes path exists
if [ -z "$ORG_NOTES" ]; then
    echo "No org_notes path is set! Set ORG_NOTES. "
    exit 1
fi

## check to see if TODAY symlinked file has been touched

#first pull from symlink
file=$(readlink $ORG_NOTES/Journal/TODAY.org)
#link=( $(ls -lat $(readlink $ORG_NOTES/Journal/TODAY.org)) )
link=( $(ls -lat $file) )
#next from the log file (assuming the correct entry is the latest one)
log=( $(tail -1 $ORG_NOTES/.log/daily_orgnotes_log.txt))
echo "${link[5]} ${link[6]} ${link[7]}"
echo "${log[0]} ${log[1]} ${log[2]}"
#check if they match
if [ "${link[5]} ${link[6]} ${link[7]}" == "${log[0]} ${log[1]} ${log[2]}" ]; then
    echo "$file not in use, moving to the trash folder!!!" >> $ORG_NOTES/.log/daily_orgnotes_log.txt
    name=${file//\//%}
    mv $file $ORG_NOTES/.trash/$name
else
    #if last file is in use, then update symlink
    rm $ORG_NOTES/Journal/YESTERDAY.org
    mv $ORG_NOTES/Journal/TODAY.org $ORG_NOTES/Journal/YESTERDAY.org
    echo "YESTERDAY.org symlink created! "
fi

# create new org file for the day
if [ ! -f $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org ]; then
    if [ ! -d $ORG_NOTES/Journal/$(date +%Y)/$(date +%B) ]; then
        mkdir -p $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)
    fi
    touch $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org
    echo $(date +%b\ %e\ %H:%M)"    "$(date +%b_%d_%A)".org created! " >> $ORG_NOTES/.log/daily_orgnotes_log.txt
fi


# update TODAY symlink
rm $ORG_NOTES/Journal/TODAY.org
ln -s $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org $ORG_NOTES/Journal/TODAY.org
echo "TODAY.org symlink created! "

