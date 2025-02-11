#!/bin/bash

# List folders in ~/projects and ~/.config
folders=$(find ~/dotfiles/.config/ ~/Projects/ ~/dotfiles/ ~/Applications/ -maxdepth 1 -type d | awk -F/ '{print $NF " :: " $0}')

selected_folder=$(echo "$folders" | fzf --prompt="Select a folder: ")

folder_path="${selected_folder#*:: }"

# echo "Selected folder path: -$folder_path"
cd "$folder_path"

if [ "$1" = "nvim" ]; then
  nvim "$folder_path"
fi
