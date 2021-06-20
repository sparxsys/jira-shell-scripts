#! /bin/bash

issue_key="an-233"
priority_id="3"
description="Upated: This is a description of the issue"
summary="Test issue updated from a shell script"
number_field=9999
text_field="Update: This is a text field"
template='{

  "fields": {
    "summary": "%s",
    "priority": {
      "id": "%s"
    },
    "customfield_10152":%s,
    "customfield_10114":"%s",
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
		    "$priority_id" \
    		    "$number_field" \
		    "$text_field" \
		    "$description")

curl -i -X PUT \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/issue/$issue_key" \
	  -d \
	  "$json_final"
	  
