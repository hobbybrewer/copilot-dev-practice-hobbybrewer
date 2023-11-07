#!/bin/bash

if [ -z "$PROJECTS_TOKEN" ]; then 
  echo "PROJECTS_TOKEN = NULL"
  exit 0
fi

source ./scripts/progress_env.sh

export GITHUB_TOKEN_BK=$GITHUB_TOKEN
export GITHUB_TOKEN=$PROJECTS_TOKEN

if [ "$PROGRESS_VERBOSE" = true ]; then 
  echo "TOKENS"
  env | grep TOKEN
  env | grep TOKEN >> ./scripts/progress_setup.txt
fi 



export ISSUE_NUMBER=$(gh issue list --state open -L 10000 -R $OWNER/$REPO --json number,title --jq '.[] | select(.title | contains(env.ISSUE_NAME)) | .number') && if [ "$PROGRESS_VERBOSE" = true ]; then echo $ISSUE_NUMBER; fi

if [ -z "$ISSUE_NUMBER" ]; then 
  gh api --header 'Accept: application/vnd.github+json' --method POST /repos/$OWNER/$REPO/issues -f title="$ISSUE_NAME" -f body="This is a test issue created by the REST API - **FROM** - [${GITHUB_REPOSITORY}](https://github.com/${GITHUB_REPOSITORY})"
else 
  echo "ISSUE Already Exists"; 
fi

export ISSUE_NUMBER=$(gh issue list --state open -L 10000 -R $OWNER/$REPO --json number,title --jq '.[] | select(.title | contains(env.ISSUE_NAME)) | .number') && if [ "$PROGRESS_VERBOSE" = true ]; then echo $ISSUE_NUMBER; fi
 
export GRAPHQL="\
    query{\
    organization(login: OWNER){\
      projectV2(number: PROJECT_NUM) {\
        id\
      }\
    }\
  }";

if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/OWNER/'\""$OWNER"\"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_NUM/'"$PROJECT_NUM"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi

export PROJECT_ID=$(gh api graphql -f query="$GRAPHQL"  | jq '.data.organization.projectV2.id') && if [ "$PROGRESS_VERBOSE" = true ]; then echo $PROJECT_ID; fi

gh project item-add $PROJECT_NUM --owner $OWNER --url https://github.com/$OWNER/$REPO/issues/$ISSUE_NUMBER

export GRAPHQL="
  query{
    node(id: PROJECT_ID) {
        ... on ProjectV2 {
          items(first: 100) {
            nodes{
              id
              fieldValues(first: 100) {
                nodes{                
                  ... on ProjectV2ItemFieldTextValue {
                    text
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                  ... on ProjectV2ItemFieldDateValue {
                    date
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                  ... on ProjectV2ItemFieldSingleSelectValue {
                    name
                    field {
                      ... on ProjectV2FieldCommon {
                        name
                      }
                    }
                  }
                }              
              }
            }
          }
        }
      }
    }"
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi
export ISSUE_ID=$(gh api graphql -f query="$GRAPHQL" | jq '.data.node.items.nodes[] | select(.fieldValues.nodes[].text == env.ISSUE_NAME) | .id') && if [ "$PROGRESS_VERBOSE" = true ]; then echo $ISSUE_ID; fi

export GRAPHQL="
  query{
  node(id: PROJECT_ID) {
    ... on ProjectV2 {
      fields(first: 100) {
        nodes {
          ... on ProjectV2Field {
            id
            name
          }
          ... on ProjectV2IterationField {
            id
            name
            configuration {
              iterations {
                startDate
                id
              }
            }
          }
          ... on ProjectV2SingleSelectField {
            id
            name
            options {
              id
              name
            }
          }
        }
      }
    }
  }
}"

if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi

gh api graphql -f query="$GRAPHQL" > ./scripts/progress_project.json

export GRAPHQL="mutation { 
    updateProjectV2ItemFieldValue( 
      input: { 
        projectId: PROJECT_ID 
        itemId: ISSUE_ID
        fieldId: CUSTOM_FIELD_ID
        value: { 
          singleSelectOptionId: SELECTION_ID
        } 
      } 
    ) { 
      projectV2Item { 
        id 
      } 
    } 
  }"

if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/ISSUE_ID/'"$ISSUE_ID"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/CUSTOM_FIELD_ID/'"$CUSTOM_FIELD_ID"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/SELECTION_ID/'"$SELECTION_ID1"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi

gh api graphql -f query="$GRAPHQL"

export GITHUB_TOKEN=$GITHUB_TOKEN_BK
if [ "$PROGRESS_VERBOSE" = true ]; then 
  echo "TOKENS"
  env | grep TOKEN >> ./scripts/progress_setup.txt
fi
