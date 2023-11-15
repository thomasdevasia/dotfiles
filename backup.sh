#!/bin/bash

# Base directory for the config files
config_base="$HOME/.config"
scripts_base="$HOME/scripts"
share_base="$HOME/.local/share"
applications_base="$HOME/.local/share/applications"

# Get the script's directory in a simpler way
script_dir=$(dirname "$(readlink -f "$0")")

# Iterate over the array and use rsync for each folder
copy_config() {
    # Array of folders to copy
    folders_to_copy=(
        "bspwm" "dunst" "eww" "flameshot" "hypr" "starship.toml"
        "goverlay" "hypr" "kitty" "mpd" "mpv" "neofetch" "picom" "polybar"
        "qtile" "ranger" "rofi" "swaylock" "sxhkd" "wal" "waybar" "wofi"
        "yay"
    )  # Replace with your folder names
    for folder in "${folders_to_copy[@]}"; do
        # rsync -av --progress --delete "$config_base/$folder/" "$script_dir/.config/$folder/"
        rsync -av --delete "$config_base/$folder/" "$script_dir/.config/$folder/"
    done
}

copy_scripts() {
    rsync -av --delete "$scripts_base/" "$script_dir/scripts/"
}

copy_share() {
    folders_to_copy=(
        "wallpaper-selector" "bluetooth-selector" "wifi-selector"
    )  # Replace with your folder names
    for folder in "${folders_to_copy[@]}"; do
        # rsync -av --progress --delete "$config_base/$folder/" "$script_dir/.config/$folder/"
        rsync -av --delete "$share_base/$folder/" "$script_dir/share/$folder/"
    done
}

copy_applications() {
    folders_to_copy=(
        "bluetooth.desktop" "wifi.desktop" "wallpaper_selector.desktop"
        "wallpaper_selector_hyprland.desktop"
    )  # Replace with your folder names
    for folder in "${folders_to_copy[@]}"; do
        # rsync -av --progress --delete "$config_base/$folder/" "$script_dir/.config/$folder/"
        rsync -av --delete "$applications_base/$folder" "$script_dir/applications/$folder"
    done
}


# gum spin --spinner points --title "Buying Bubble Gum..." -- copy_config
# gum spin --spinner points --title "Copying Configs" -- copy_config
copy_config
copy_scripts
copy_share
copy_applications

rsync -av --delete "$HOME/.zshrc" "$script_dir/.zshrc"
rsync -av --delete "$HOME/.zprofile" "$script_dir/.zprofile"
rsync -av --delete "$HOME/.xinitrc" "$script_dir/.xinitrc"
rsync -av --delete "$HOME/.xprofile" "$script_dir/.xprofile"
rsync -av --delete "$HOME/.bashrc" "$script_dir/.bashrc"
rsync -av --delete "$HOME/.bash_profile" "$script_dir/.bash_profile"