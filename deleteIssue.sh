#! /bin/bash

issue_key="an-216"

curl -s -X \
     DELETE -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/issue/$issue_key?deleteSubtasks=true" \
     | jq 
