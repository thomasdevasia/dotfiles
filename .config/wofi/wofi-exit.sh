#!/usr/bin/env bash

# A rofi-like System/Exit menu for wofi

# wofi crashes w/ no cache file, so let's use a custom one and delete it every time, to avoid reordering entries
# rm /home/piotr/.local/share/wofi/exit.cache

A=$(wofi --show dmenu --width=100 --height=200  --prompt=System cat <<EOF
Lock
Logout
Reboot
Shutdown
EOF
)

case "$A" in

    *Lock) swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 2 --fade-in 0.2 ;;

    *Logout)  hyprctl dispatch exit ;;

    *Reboot) swaynagmode -R -t red -m ' You are about to restart the machine? Proceed?' \
      -b '  Reboot ' 'systemctl reboot' ;;

    *Shutdown) shutdown now ;;

esac

exit 0