#!/bin/bash

export PATH=$PATH:/home/thomasdevasia/.local/bin:/home/thomasdevasia/.cargo/bin

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
# kitty ranger --choosefile=/home/thomasdevasia/.cache/wallpaper-selector/.wallpaper /home/thomasdevasia/Pictures
ghostty -e yazi --chooser-file /home/thomasdevasia/.cache/wallpaper-selector/.wallpaper /home/thomasdevasia/Pictures
selection=$(cat /home/thomasdevasia/.cache/wallpaper-selector/.wallpaper)

echo $selection

# pywal selection to generate color scheme
wal -i "$selection"

python /home/thomasdevasia/scripts/change_wallpaper.py "$selection"

# reloading hyprpaper
# killall hyprpaper
# hyprpaper &
swww img "$selection" --transition-fps 30 --transition-type random --transition-duration 2

# reloding waybar
sh /home/thomasdevasia/.config/waybar/launch.sh

# removing pywal colors for hyprland and copying new colors
rm ~/.config/hypr/colors-hyprland.conf
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors-hyprland.conf

# changing css file for swaync
rm ~/.config/swaync/colors-wayabr.css
cp ~/.cache/wal/colors-waybar.css ~/.config/swaync/colors-wayabr.css

# running change colors script
python /home/thomasdevasia/scripts/change_colors.py

# create a pallete for ghostty
python ~/scripts/create_ghostty_pallete.py

notify-send "Wallpaper changed to $selection"
