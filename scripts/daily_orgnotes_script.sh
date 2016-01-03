#!/bin/bash

# Script to create daily org file for each day
# Also links a TODAY.org each day for easier access

# check if orgnotes path exists
if [ -z "$ORG_NOTES" ]; then
    echo "No org_notes path is set! Set ORG_NOTES. "
    exit 1
fi

# create new org file for the day
touch $ORG_NOTES/Journal/$(date +%Y)/$(date +%A_%b_%d).org
echo $(date +%A_%b_%d)".org created! "

# update TODAY symlink
rm $ORG_NOTES/Journal/TODAY.org
ln -s $ORG_NOTES/Journal/$(date +%Y)/$(date +%A_%b_%d).org $ORG_NOTES/Journal/TODAY.org
echo "TODAY.org symlink created! "

# update YESTERDAY symlink
rm $ORG_NOTES/Journal/YESTERDAY.org
ln -s $ORG_NOTES/Journal/$(date +%Y -d "yesterday")/$(date +%A_%b_%d -d "yesterday").org $ORG_NOTES/Journal/YESTERDAY.org
echo "YESTERDAY.org symlink created! "
