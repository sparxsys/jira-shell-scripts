#! /bin/bash

# Usage
# ./updateFilter.sh "10132" "priority = High" "Filter High Priority" "Description of the Filter"


FILTER_ID=$1
FILTER_JQL=$2
FILTER_NAME=$3
FILTER_DESCRIPTION=$4

JSON_TEMPLATE='{
  "description": "%s",
  "jql": "%s",
  "name": "%s"
}'

JSON_FINAL=$(printf "$JSON_TEMPLATE" \
		    "$FILTER_DESCRIPTION" \
		    "$FILTER_JQL" \
		    "$FILTER_NAME")

curl -i -X PUT \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/filter/$FILTER_ID" \
	  -d \
	  "$JSON_FINAL"
