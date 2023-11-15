#!/bin/bash

# List folders in ~/projects and ~/.config
folders=$(find ~/Desktop/Projects/outlook_graph ~/Desktop/Projects/ ~/.config ~/scripts -maxdepth 1 -type d | awk -F/ '{print $NF " :: " $0}')

# Use rofi to let the user select one of the folders
selected=$(echo "$folders" | wofi --dmenu -p "Select a folder:" | awk -F' :: ' '{print $2}')

# Check if user selected a folder
if [ -n "$selected" ]; then
    # Open the selected folder in VSCode
    # echo "$selected"
    code-insiders "$selected"
# else
#     # Notify the user that no folder was selected
#     notify-send "No folder selected" "You didn't select a folder."
fi