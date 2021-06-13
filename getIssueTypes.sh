#! /bin/bash

echo "id,name,subtask,scope"
curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/issuetype" \
    | jq -r '.[] | "\(.id),\(.name),\(.subtask),\(.scope.type)"'
