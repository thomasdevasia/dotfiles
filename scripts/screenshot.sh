#!/bin/bash

# pass 3 options via wofi monitor, window, selection
selected=$(echo -e "output\nwindow\nregion" | wofi --dmenu -p 'Select a folder:')

hyprshot -m $selected -o /home/thomasdevasia/Pictures/Screenshots
