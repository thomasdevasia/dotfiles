#!/bin/bash

# Run Pywal to generate and apply a color scheme
echo "before wal"

folder_name="$HOME/.cache/wallpaper-selector"
# Check if the folder exists
if [ ! -d "$folder_name" ]; then
    mkdir "$folder_name"
    echo "Folder '$folder_name' created successfully."
else
    echo "Folder '$folder_name' already exists."
fi

# ranger to save image in file
kitty ranger --choosefile=/home/thomasdevasia/.cache/wallpaper-selector/.wallpaper /home/thomasdevasia/Pictures
selection=$(cat /home/thomasdevasia/.cache/wallpaper-selector/.wallpaper)

echo $selection

# pywal selection to generate color scheme
~/.local/bin/wal -i "$selection"

python /home/thomasdevasia/.local/share/wallpaper-selector/change_wallpaper.py "$selection"

# reloading hyprpaper
# killall hyprpaper
# hyprpaper &
$HOME/packages/swww/target/release/swww img $selection --transition-fps 30 --transition-type random --transition-duration 2

# reloding waybar
sh /home/thomasdevasia/.config/waybar/launch.sh