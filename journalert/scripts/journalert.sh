#!/usr/bin/env bash
#
# This script is meant to be run via NRPE
#
# This script reads the icinga_alert_file and tries to determine
# the appropriate EXIT code based on its contents
#
# The echo output is picked up by Nagios / Icinga to display in
# warnings / errors

set -uo pipefail
ALERT_FILE=$1
IFS=$'\n'
if [ -z "$ALERT_FILE" ]
then
    echo
    echo "Requires alert file as argument"
    echo
    exit 1
fi

DISPLAY_RESULT=`cat $ALERT_FILE`
RESULT=`echo $DISPLAY_RESULT | grep "^OK:"`
ERROR=$?

echo $DISPLAY_RESULT
exit $ERROR
