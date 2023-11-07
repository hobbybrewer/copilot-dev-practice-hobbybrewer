#!/bin/bash

if [ -z "$PROJECTS_TOKEN" ]; then 
  echo "PROJECTS_TOKEN = NULL"
  exit 0
fi

source ./scripts/progress_env.sh
source ./scripts/progress_setup.sh

export GITHUB_TOKEN_BK=$GITHUB_TOKEN
export GITHUB_TOKEN=$PROJECTS_TOKEN

if [ "$PROGRESS_VERBOSE" = true ]; then 
  echo "TOKENS"
  env | grep TOKEN >> ./scripts/progress_stage1.txt
fi

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
if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi && GRAPHQL=$(echo "$GRAPHQL" | sed -e 's/SELECTION_ID/'"$SELECTION_ID2"'/g') && if [ "$PROGRESS_VERBOSE" = true ]; then echo "$GRAPHQL"; fi

gh api graphql -f query="$GRAPHQL"

export GITHUB_TOKEN=$GITHUB_TOKEN_BK
if [ "$PROGRESS_VERBOSE" = true ]; then 
  echo "TOKENS"
  env | grep TOKEN >> ./scripts/progress_stage1.txt
fi
