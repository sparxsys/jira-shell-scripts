#! /bin/bash

curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/dashboard" \
     | jq '.dashboards[] | "\(.owner.accountId),\(.name),\(.view)"'
