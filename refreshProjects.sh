#!/bin/bash
source progress_bar.sh

# Make sure that the progress bar is cleaned up when user presses ctrl+c
enable_trapping
# Create progress bar
setup_scroll_area



DIR=$(pwd)
echo "Current directory:" $DIR
cd $DIR
PROJECTS=$(ls -d */)
array=($PROJECTS)
TOTAL=${#array[@]}
INDEX=0
for element in "${array[@]}"; do
  echo "UPDATING:........................................................." $element
  cd $DIR"/"$element
  STATUS=$(git status | grep "On branch" | cut -d " " -f3)
  if [ "$STATUS" = "master" ]; then
    git pull origin master --rebase
  else
    git fetch origin
  fi
  draw_progress_bar $INDEX
  let "INDEX++"
done
