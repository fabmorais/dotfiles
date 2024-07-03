#!/bin/bash

# File path for GTK settings
GTK_SETTINGS_FILE="$HOME/.config/gtk-3.0/settings.ini"

# Read the GTK theme name from the settings file
GTK_THEME=$(grep "gtk-theme-name" $GTK_SETTINGS_FILE | cut -d '=' -f 2)

# Define the path to Alacritty themes and current theme
ALACRITTY_THEMES_DIR="$HOME/.config/alacritty/themes"
CURRENT_THEME="$HOME/.config/alacritty/current_theme.toml"

# Define a mapping from GTK themes to Alacritty themes
declare -A THEME_MAP
THEME_MAP=(
    ["Dracula"]="dracula"
    ["Gruvbox-Retro"]="gruvbox_dark"
    ["Catppuccin-Mocha"]="catppuccin_macchiato"
    ["Catppuccin-Latte"]="catppuccin_latte"
    ["Edge-Runner"]="cyberpunk"
    ["Tokyo-Night"]="tokyo_night"
    ["One-Dark"]="one_dark"
    ["Rose-Pine"]="rose_pine"
    ["Nordic-Blue"]="nordic"
    # Add more mappings as needed
)

DEFAULT_THEME="hard_hacker"

# Function to change Alacritty theme
change_alacritty_theme() {
    THEME_NAME=$1
    THEME_FILE="$ALACRITTY_THEMES_DIR/$THEME_NAME.toml"

    if [ -f "$THEME_FILE" ]; then
        ln -sf "$THEME_FILE" "$CURRENT_THEME"
        echo "Alacritty theme changed to $THEME_NAME"
    else
        echo "Theme file $THEME_FILE does not exist"
    fi
}

# Check the GTK theme and change Alacritty theme accordingly
if [[ ${THEME_MAP[$GTK_THEME]+_} ]]; then
    change_alacritty_theme "${THEME_MAP[$GTK_THEME]}"
else
    echo "No matching Alacritty theme found for GTK theme: $GTK_THEME"
    echo "Setting default Alacritty theme: $DEFAULT_THEME"
    change_alacritty_theme "$DEFAULT_THEME"
fi
