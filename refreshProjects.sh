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
for element in "${array[@]}"
do
    echo "UPDATING:........................................................." $element
    cd $DIR"/"$element
    git pull origin master --rebase
    draw_progress_bar $INDEX
    let "INDEX++"
done

