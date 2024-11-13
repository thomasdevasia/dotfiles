#!/bin/sh

if pgrep -x "waybar" >/dev/null; then
  # If running, kill the process
  pkill -x "waybar"
  notify-send "Waybar stopped."
else
  # If not running, start the process
  waybar -c ~/.config/waybar/tempConfig -s ~/.config/waybar/tempStyle.css &
  notify-send "Waybar started."
fi
