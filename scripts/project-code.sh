#!/bin/bash

# List folders in ~/projects and ~/.config
# folders=$(find ~/Desktop/Projects/outlook_graph ~/Desktop/Projects/ ~/.config ~/scripts -maxdepth 1 -type d | awk -F/ '{print $NF " :: " $0}')
folders=$(find -L ~/Desktop/Projects/ ~/.config ~/scripts -maxdepth 1 -type d | awk -F/ '{print $NF " :: " $0}')

# Use rofi to let the user select one of the folders
selected=$(echo "$folders" | wofi --dmenu -p "Select a folder:" | awk -F' :: ' '{print $2}')

# Check if user selected a folder
if [ -n "$selected" ]; then
  # Open the selected folder in VSCode
  # echo "$selected"
  cd "$selected"
  if [ $1 == "vscode" ]; then
    # code-insiders "$selected"
    # hyprctl dispatch exec [ workspace 2 silent ] "kitty --detach -d \"$selected\" nvim . "
    #
    # hyprctl dispatch exec [ workspace 3 silent ] "kitty \"$selected\" --detach"
    # get name of the last folder
    projectName=$(echo "$selected" | awk -F/ '{print $NF}' | tr ' ' '_')
    # echo $projectName

    hyprctl dispatch exec "kitty --detach -d \"$selected\" nvim . "
    hyprctl dispatch exec "kitty --detach -d \"$selected\" tmux new-session -A -s $projectName"

  else
    # env -u WAYLAND_DISPLAY /home/thomasdevasia/.local/bin/zed "$selected"
    # nvim "$selected"
    # kitty -e nvim "$selected"
    code-insiders "$selected"
  fi
  # code-insiders "$selected"
  # /home/thomasdevasia/.local/bin/zed "$selected"

# else
#     # Notify the user that no folder was selected
#     notify-send "No folder selected" "You didn't select a folder."
fi
