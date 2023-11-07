#!/bin/bash

source ./scripts/progress_env.sh
source ./scripts/progress_setup.sh

export GITHUB_TOKEN_BK=$GITHUB_TOKEN
export GITHUB_TOKEN=$PROJECTS_TOKEN
#echo "TOKENS"
#env | grep TOKEN >> progress_stage.txt

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

echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/PROJECT_ID/'"$PROJECT_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/ISSUE_ID/'"$ISSUE_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/CUSTOM_FIELD_ID/'"$CUSTOM_FIELD_ID"'/g') && echo "$GRAPHQL"
echo "$GRAPHQL" && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/SELECTION_ID/'"$SELECTION_ID"'/g') && echo "$GRAPHQL"

gh api graphql -f query="$GRAPHQL"

export GITHUB_TOKEN=$GITHUB_TOKEN_BK
#echo "TOKENS"
#env | grep TOKEN