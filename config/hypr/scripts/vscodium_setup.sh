#!/bin/bash

# Read current GTK theme
current_gtk_theme=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")

# Alternative method if gsettings fails (directly reads from GTK config)
if [ -z "$current_gtk_theme" ]; then
    current_gtk_theme=$(grep 'gtk-theme-name' ~/.config/gtk-3.0/settings.ini | cut -d= -f2 | tr -d ' ' | tr -d '"')
fi

# Map GTK themes to VSCodium color themes
declare -A gtk_to_vscodium=(
    ["Dracula"]="Dracula"
    ["Nordic"]="Nord"
    ["One-Dark"]="One Dark Pro"
    ["Adwaita-dark"]="Default Dark+"
    ["Yaru-dark"]="Default Dark+"
    ["Catppuccin-Mocha"]="Catppuccin Mocha"
    ["Catppuccin-Latte"]="Catppuccin Latte"
    ["Gruvbox-Dark"]="Gruvbox Dark"
    ["Tokyo-Night"]="Tokyo Night"
    ["Rose-Pine"]="Rosé Pine"
)

# Default fallback theme
default_vscodium_theme="Default Dark+"

# Get matching VSCodium theme
vscodium_theme=${gtk_to_vscodium["$current_gtk_theme"]}
if [ -z "$vscodium_theme" ]; then
    echo "No theme mapping found for '$current_gtk_theme', using default"
    vscodium_theme="$default_vscodium_theme"
fi

# VSCodium config paths
vscodium_settings="$HOME/.config/VSCodium/User/settings.json"
vscodium_settings_dir=$(dirname "$vscodium_settings")

# Create directory if needed
mkdir -p "$vscodium
