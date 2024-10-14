#!/usr/bin/env bash
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
