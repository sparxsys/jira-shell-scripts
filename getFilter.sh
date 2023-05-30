#! /bin/bash

FILTER_ID=$1

curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/filter/$FILTER_ID" \
     | jq -r '.jql'
