#!/bin/bash

# Path to HyDE theme configuration
HYDE_THEME_FILE="$HOME/.config/hypr/themes/wallbash.conf"

# Extract the current HyDE theme name
HYDE_THEME=$(grep "^\$HYDE_THEME=" "$HYDE_THEME_FILE" | cut -d '=' -f 2)

echo "Detected HyDE theme: '$HYDE_THEME'"

# Define the path to Alacritty themes and current theme
ALACRITTY_THEMES_DIR="$HOME/.config/alacritty/themes"
CURRENT_THEME="$HOME/.config/alacritty/current_theme.toml"

# Define a mapping from HyDE themes to Alacritty themes
declare -A THEME_MAP
THEME_MAP=(
    ["Catppuccin Mocha"]="catppuccin_mocha"
    ["Catppuccin Latte"]="catppuccin_latte"
    ["Catppuccin Frappe"]="catppuccin_frappe"
    ["Catppuccin Macchiato"]="catppuccin_macchiato"
    ["Dracula"]="dracula"
    ["Nordic"]="nordic"
    ["Nordic Blue"]="nordic"
    ["Gruvbox"]="gruvbox_dark"
    ["Gruvbox Retro"]="gruvbox_dark"
    ["Rose Pine"]="rose_pine"
    ["Rosé Pine"]="rose_pine"
    ["Tokyo Night"]="tokyo_night"
    ["Hack the Box"]="hardhacker"
    ["Hackthebox"]="hardhacker"
    ["Synth Wave"]="synth_wave"
    ["Oxocarbon"]="oxo_carbon"
    ["Material Sakura"]="material_sakura"
    ["Decay Green"]="decay_green"
    ["Graphite Mono"]="graphite_mono"
    ["One Dark"]="one_dark"
    ["Edge Runner"]="cyberpunk"
    ["Frosted Glass"]="frosted_glass"
    ["Vanta Black"]="vanta_black"
)

DEFAULT_THEME="catppuccin_mocha"

# Function to change Alacritty theme
change_alacritty_theme() {
    THEME_NAME=$1
    THEME_FILE="$ALACRITTY_THEMES_DIR/$THEME_NAME.toml"

    if [ -f "$THEME_FILE" ]; then
        ln -sf "$THEME_FILE" "$CURRENT_THEME"
        echo "✓ Alacritty theme changed to $THEME_NAME"
    else
        echo "✗ Theme file $THEME_FILE does not exist"
        echo "  Using default theme instead"
        DEFAULT_FILE="$ALACRITTY_THEMES_DIR/$DEFAULT_THEME.toml"
        if [ -f "$DEFAULT_FILE" ]; then
            ln -sf "$DEFAULT_FILE" "$CURRENT_THEME"
        fi
    fi
}

# Check the HyDE theme and change Alacritty theme accordingly
if [[ ${THEME_MAP[$HYDE_THEME]+_} ]]; then
    change_alacritty_theme "${THEME_MAP[$HYDE_THEME]}"
else
    echo "⚠ No matching Alacritty theme found for HyDE theme: '$HYDE_THEME'"
    echo "  Setting default Alacritty theme: $DEFAULT_THEME"
    change_alacritty_theme "$DEFAULT_THEME"
fi
