#! /bin/bash

curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/auditing/record" \
     | jq '.records[] | "\(.created),\(.authorKey),\(.category),\(.summary),\(.objectItem.name)"'
