#! /bin/bash

issue_key="an-231"

curl -s -i -X POST \
     -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     -H "X-Atlassian-Token:no-check" \
     -F "file=@/home/ravisagar/output.png" \
     'https://jiratutorial.atlassian.net/rest/api/3/issue/'$issue_key'/attachments' 
     
