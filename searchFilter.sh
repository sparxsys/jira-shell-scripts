#! /bin/bash

curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/filter/search" \
     | jq -r '.values | .[] | "\(.id),\(.name)"'

