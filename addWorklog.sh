#! /bin/bash


# Make sure there is a ~/jiraissues.csv file in your home directory
# Format of the file should be like this
# KEY-1,2h,02/06/2021
# Just run the script

while read line
do
     issuekey="$(echo $line | cut -d ',' -f 1)"
     worklog="$(echo $line | cut -d ',' -f 2)"
     d="$(echo $line | cut -d ',' -f 3)"

     day=$(echo $d | cut -d '/' -f 1)
     month=$(echo $d | cut -d '/' -f 2)
     year=$(echo $d | cut -d '/' -f 3)

     curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/issue/$issuekey/worklog" \
	  -d \
	  '{ 
     	"timeSpent": "'$worklog'",
        "started": "'$year'-'$month'-0'$day'T18:00:00.751+0000" 
     }'
     
     sleep .5
done < ~/jiraissues.csv

notify-send "Timesheets" "All done!"

exit
