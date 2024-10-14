#!/usr/bin/env bash
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
RESULT=`echo $DISPLAY_RESULT | grep "OK:"`
ERROR=$?

echo $DISPLAY_RESULT
exit $ERROR
