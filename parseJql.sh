#! /bin/bash

jql="filter=10103"
> /tmp/tmp.csv
curl -s \
     GET -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
     "https://jiratutorial.atlassian.net/rest/api/3/search?jql=$jql" \
    | jq -r '.issues[] |  "\(.key),\(.fields.summary) "' >> /tmp/tmp.csv

while read line
do
    notify-send "$(echo $line | cut -d ',' -f 1)" \
		"$(echo $line | cut -d ',' -f 2)"
    sleep .5
done < /tmp/tmp.csv
