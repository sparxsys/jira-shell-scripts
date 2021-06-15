#! /bin/bash

issuekey="sd-28"

curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/issue/$issuekey/comment" \
	  -d \
	  '{
    "body": {
        "type": "doc",
        "version": 1,
        "content": [
          {
            "type": "paragraph",
            "content": [
              {
                "text": "I am working on the issue",
                "type": "text"
              }
            ]
          }
        ]
      }
    }'
