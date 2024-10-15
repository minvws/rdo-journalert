#!/usr/bin/env bash
#
# This script is meant to be run via NRPE
# 
# This script determines if there are any errors 
# generated this day until now.
#
# Journalert doesn't create an alert log file
# if no alerts are received.
#
set -uo pipefail
LOG_FILE=$1
TODAY=$(date '+%Y_%m_%d')
TODAY_FILE="${LOG_FILE}_${TODAY}"

if [ -e "$TODAY_FILE" ]
then
    echo "Warning: log errors found today"
    ERROR=1
else
    echo "OK: no log errors today"
    ERROR=0
fi

exit $ERROR
