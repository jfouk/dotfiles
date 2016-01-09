#!/bin/bash

# Script to create daily org file for each day
# Also links a TODAY.org each day for easier access

# check if orgnotes path exists
if [ -z "$ORG_NOTES" ]; then
    echo "No org_notes path is set! Set ORG_NOTES. "
    exit 1
fi

# create new org file for the day
if [ ! -f $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org ]; then
    touch $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org
    echo $(date +%D%t%H:%M)"    "$(date +%b_%d_%A)".org created! " >> $ORG_NOTES/.log/daily_orgnotes_log.txt
fi

# check to see if TODAY symlinked file has been touched
# pull symlink
link=( $(ls -lat $(readlink $ORG_NOTES/Journal/TODAY.org)) )

# update YESTERDAY symlink
rm $ORG_NOTES/Journal/YESTERDAY.org
mv $ORG_NOTES/Journal/TODAY.org $ORG_NOTES/Journal/YESTERDAY.org
echo "YESTERDAY.org symlink created! "

# update TODAY symlink
#rm $ORG_NOTES/Journal/TODAY.org
ln -s $ORG_NOTES/Journal/$(date +%Y)/$(date +%B)/$(date +%b_%d_%A).org $ORG_NOTES/Journal/TODAY.org
echo "TODAY.org symlink created! "

