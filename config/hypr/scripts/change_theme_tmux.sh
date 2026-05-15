#!/bin/bash

# Path to HyDE theme configuration
HYDE_THEME_FILE="$HOME/.config/hypr/themes/wallbash.conf"

# Extract the current HyDE theme name
HYDE_THEME=$(grep "^\$HYDE_THEME=" "$HYDE_THEME_FILE" | cut -d '=' -f 2)

echo "Detected HyDE theme: '$HYDE_THEME'"

# Define the path to tmux themes and current theme symlink
TMUX_THEMES_DIR="$HOME/.tmux/conf/themes"
CURRENT_THEME="$TMUX_THEMES_DIR/current_theme.conf"

# Define a mapping from HyDE themes to tmux theme files (without .conf)
declare -A THEME_MAP
THEME_MAP=(
    ["Catppuccin Mocha"]="catppuccin_mocha"
    ["Catppuccin Latte"]="catppuccin_mocha"
    ["Catppuccin Frappe"]="catppuccin_mocha"
    ["Catppuccin Macchiato"]="catppuccin_mocha"
    ["Dracula"]="dracula"
    ["Gruvbox"]="gruvbox"
    ["Gruvbox Retro"]="gruvbox"
    ["Tokyo Night"]="tokyo_night"
    ["Rose Pine"]="rose_pine"
    ["Rosé Pine"]="rose_pine"
    ["Synth Wave"]="synth_wave"
    ["Hack the Box"]="hardhacker"
    ["Hackthebox"]="hardhacker"
    ["Graphite Mono"]="graphite_mono"
    ["Oxocarbon"]="oxo_carbon"
    ["Vanta Black"]="vanta_black"
)

DEFAULT_THEME="skin_dark"

# Function to change tmux theme
change_tmux_theme() {
    THEME_NAME=$1
    THEME_FILE="$TMUX_THEMES_DIR/$THEME_NAME.conf"

    if [ -f "$THEME_FILE" ]; then
        ln -sf "$THEME_FILE" "$CURRENT_THEME"
        echo "✓ tmux theme changed to $THEME_NAME"
    else
        echo "✗ Theme file $THEME_FILE does not exist"
        echo "  Using default theme instead"
        DEFAULT_FILE="$TMUX_THEMES_DIR/$DEFAULT_THEME.conf"
        if [ -f "$DEFAULT_FILE" ]; then
            ln -sf "$DEFAULT_FILE" "$CURRENT_THEME"
        fi
    fi
}

# Check the HyDE theme and change tmux theme accordingly
if [[ ${THEME_MAP[$HYDE_THEME]+_} ]]; then
    change_tmux_theme "${THEME_MAP[$HYDE_THEME]}"
else
    echo "⚠ No matching tmux theme found for HyDE theme: '$HYDE_THEME'"
    echo "  Setting default tmux theme: $DEFAULT_THEME"
    change_tmux_theme "$DEFAULT_THEME"
fi

# Reload tmux config in any running server so active sessions pick up the theme
if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
    tmux source-file "$HOME/.tmux.conf" >/dev/null 2>&1 \
        && echo "✓ tmux config reloaded"
fi
