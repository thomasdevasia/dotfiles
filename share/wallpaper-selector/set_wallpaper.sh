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
# feh selection
feh --bg-fill "$selection"

/home/thomasdevasia/.local/bin/betterlockscreen -u "$selection" --fx blur &

. "${HOME}/.cache/wal/colors.sh"
polybar_colors() {
  # Modify this function according to your polybar configuration
  polybar_config="$HOME/.config/polybar/config.ini"

  # Update the colors in polybar config file
#   sed -i "s/background = #.*/background = $color0/" "$polybar_config"
  sed -i "s/cforeground = #.*/cforeground = $color6/" "$polybar_config"
#   sed -i "s/background-alt = #.*/background-alt = $color6/" "$polybar_config"
  sed -i "s/cprimary = #.*/cprimary = $color1/" "$polybar_config"
  sed -i "s/csecondary = #.*/csecondary = $color2/" "$polybar_config"
  sed -i "s/cdisabled = #.*/cdisabled = $color8/" "$polybar_config"
}
polybar_colors

# restart bspwm
xdotool keydown Super
xdotool keydown Alt
xdotool keydown Control
xdotool key r

xdotool keyup Super
xdotool keyup Alt
xdotool keyup Control