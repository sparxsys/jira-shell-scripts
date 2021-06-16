#! /bin/bash

key="NEWPRJKEY"
project_name="New New Project"
project_type_key="business"
project_template_key="com.atlassian.jira-core-project-templates:jira-core-project-management"
project_description="This project will be used to do magic"
lead_account_id="557058:f2a3043a-ebcb-4815-9277-e0e14c4d9776"
url="https://www.ravisagar.com"
assignee_type="PROJECT_LEAD"
avatar_id=10200
notification_scheme=10007

template='
{
    "key": "%s",
    "name": "%s",
    "projectTypeKey": "%s",
    "projectTemplateKey": "%s",
    "description": "%s",
    "leadAccountId": "%s",
    "url": "%s",
    "assigneeType": "%s",
    "avatarId": %s,
    "notificationScheme": %s
}
'


json_final=$(printf "$template" \
		    "$key" \
		    "$project_name" \
		    "$project_type_key" \
		    "$project_template_key" \
		    "$project_description" \
		    "$lead_account_id" \
		    "$url" \
		    "$assignee_type" \
		    "$avatar_id" \
		    "$notification_scheme")

curl -i -X POST \
	  -H "Authorization:Basic $JIRATUTORIAL_AUTH" \
	  -H "Content-Type:application/json" \
	  -H "X-Atlassian-Token:no-check" \
	  "https://jiratutorial.atlassian.net/rest/api/3/project/" \
	  -d \
	  "$json_final"
