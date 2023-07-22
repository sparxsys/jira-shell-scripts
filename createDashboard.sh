#! /bin/bash

# Usage
# ./createDashboard.sh "Dashboard Description" "Dashboard Name"

DASHBOARD_DESCRIPTION=$1
DASHBOARD_NAME=$2

JSON_TEMPLATE='{
  "description": "%s",
  "editPermissions": [],
  "name": "%s",
  "sharePermissions": []
}'

JSON_FINAL=$(printf "$JSON_TEMPLATE" \
		    "$DASHBOARD_DESCRIPTION" \
		    "$DASHBOARD_NAME")

curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/dashboard" \
	  -d \
	  "$JSON_FINAL"
