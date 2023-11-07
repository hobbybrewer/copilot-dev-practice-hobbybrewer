#!/bin/bash

export PROGRESS_VERBOSE=true
export PROGRESS_VERBOSE=false
export PROJECT_NUM=2
export ISSUE_NAME="${GITHUB_USER}-progress"
export OWNER="dhruvg20-copilot"
export REPO="Copilot-Dev-Practices-Progress"
export CUSTOM_FIELD_ID="PVTSSF_lADOB1l0iM4AXa6zzgO-Juc"
export CUSTOM_FIELD_ID="\"$CUSTOM_FIELD_ID\""
export SELECTION_ID1="02cde7b5" #Codespace Created
export SELECTION_ID2="cfddcb45" #Activity 1 - Steps 1
export SELECTION_ID3="8e83b234" #Activity 1 - Steps 2
export SELECTION_ID4="8f3d3a2c" #Activity 2 - Steps 1
export SELECTION_ID5="a753558a" #Activity 2 - Steps 2
export SELECTION_ID6="a8ddf0ac" #Activity 3 - Steps 1
export SELECTION_ID7="3bd59492" #Activity 3 - Steps 2

export SELECTION_ID1="\"$SELECTION_ID1\""   #Codespace Created
export SELECTION_ID2="\"$SELECTION_ID2\""   #Activity 1 - Steps 1
export SELECTION_ID3="\"$SELECTION_ID3\""   #Activity 1 - Steps 2
export SELECTION_ID4="\"$SELECTION_ID4\""   #Activity 2 - Steps 1
export SELECTION_ID5="\"$SELECTION_ID5\""   #Activity 2 - Steps 2
export SELECTION_ID6="\"$SELECTION_ID6\""   #Activity 3 - Steps 1
export SELECTION_ID7="\"$SELECTION_ID7\""   #Activity 3 - Steps 2


if [ "$PROGRESS_VERBOSE" = true ]; then 
    echo "PROJECT_NUM=$PROJECT_NUM";
    echo "ISSUE_NAME=$ISSUE_NAME"
    echo "OWNER=$OWNER"
    echo "REPO=$REPO"
    echo "CUSTOM_FIELD_ID=$CUSTOM_FIELD_ID"
    echo "SELECTION_ID=$SELECTION_ID"
fi
