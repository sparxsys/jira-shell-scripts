#! /bin/bash

# Usage
# ./createFilter.sh "priority = High" "Filter High Priority" "Description of the Filter"

FILTER_JQL=$1
FILTER_NAME=$2
FILTER_DESCRIPTION=$3

JSON_TEMPLATE='{
  "description": "%s",
  "jql": "%s",
  "name": "%s"
}'

JSON_FINAL=$(printf "$JSON_TEMPLATE" \
		    "$FILTER_DESCRIPTION" \
		    "$FILTER_JQL" \
		    "$FILTER_NAME")

curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/filter" \
	  -d \
	  "$JSON_FINAL"
