#! /bin/bash

json='{
  "visibility": "private",
  "isEnabled": true,
  "isDismissible": false,
  "message": "For support raise ticket here: https://www.ravisagar.in/support"
}'

curl -i -X PUT \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/announcementBanner" \
	  -d \
	  "$json"
