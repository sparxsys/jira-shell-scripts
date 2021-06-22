#! /bin/bash

project_key=$1

curl -s -X \
     DELETE -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/project/$project_key" \
     | jq 
