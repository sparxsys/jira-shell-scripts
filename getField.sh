#! /bin/bash

echo "id,key,name,schema.custom"
curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/field" \
    | jq -r '.[] | "\(.id),\(.key),\(.name),\(.schema.custom)"'
