#!/bin/bash

# Run Pywal to generate and apply a color scheme
echo "before wal"
selection=$(ls ~/Pictures | /home/thomasdevasia/.config/rofi/dmenu/launcher.sh)
~/.local/bin/wal -i ~/Pictures/$selection