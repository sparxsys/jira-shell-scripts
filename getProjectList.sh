#! /bin/bash

curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/project/search?expand=lead" \
    | jq '.values[] | "\(.id),\(.key),\(.name),\(.lead.displayName)"'
