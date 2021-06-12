#! /bin/bash

curl -s  GET -H "Authorization:Basic $JIRATUTORIAL_AUTH"  'https://jiratutorial.atlassian.net/rest/api/3/issue/IOSTWO-21' | jq '.fields.attachment[] | .content'
