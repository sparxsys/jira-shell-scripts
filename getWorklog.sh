#! /bin/bash

ISSUE=$1

 curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/latest/issue/$ISSUE/worklog" \
    | jq -r '.worklogs[] | "\(.id),\(.created),\(.timeSpent)"'
