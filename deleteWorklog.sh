#! /bin/bash

ISSUE=$1
WORKLOGID=$2

 curl -s -X \
     DELETE -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/latest/issue/$ISSUE/worklog/$WORKLOGID"
