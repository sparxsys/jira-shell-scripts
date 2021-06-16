#! /bin/bash

issuetype_id="10001"
project_id="10037"
priority_id="2"
description="This is a desction of the issue"
summary="Test issue created from a shell script"

template='{

  "fields": {
    "summary": "%s",
    "issuetype": {
      "id": "%s"
    },
    "project": {
      "id": "%s"
    },
    "priority": {
      "id": "%s"
    },
    
    "description": {
      "type": "doc",
      "version": 1,
      "content": [
        {
          "type": "paragraph",
          "content": [
            {
              "text": "%s",
              "type": "text"
            }
          ]
        }
      ]
    }
  }
}'

json_final=$(printf "$template" \
		    "$summary" \
		    "$issuetype_id" \
		    "$project_id" \
		    "$priority_id" \
		    "$description")

curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/issue/" \
	  -d \
	  "$json_final"
	  
